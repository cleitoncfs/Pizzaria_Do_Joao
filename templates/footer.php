<footer>
    <style>
        footer {
            position: relative;
            width: 100%;
            padding: 20px 0;
            background: linear-gradient(to right, #111, #222);
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.5);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            text-align: center;
        }

        footer p {
            font-size: 0.9em;
            font-weight: 500;
            margin: 5px 0;
        }

        footer a i {
            color: #fff;
            font-size: 24px;
            margin: 0 8px;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        footer a:hover i {
            transform: scale(1.2);
            color: #ffcc00;
        }

        footer a span {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            footer {
                padding: 15px;
            }

            footer p {
                font-size: 0.85em;
            }

            footer a i {
                font-size: 20px;
                margin: 0 5px;
            }
        }
    </style>

    <p>
        &copy; <?php echo date("Y"); ?> Pizzaria do João – Todos os direitos reservados
    </p>

    <p>
        Desenvolvido por 
        <a 
            href="https://portfolio-cleiton.netlify.app/" 
            target="_blank" 
            rel="noopener noreferrer"
            aria-label="Portfólio do desenvolvedor (abre em nova aba)"
            style="color: #fff;"
        >
            <span>Cleiton Santos</span>
        </a>
    </p>

    <div>
        <a href="https://www.facebook.com/" target="_blank"><i class="bi bi-facebook"></i></a>
        <a href="https://www.instagram.com/" target="_blank"><i class="bi bi-instagram"></i></a>
        <a href="https://www.youtube.com/" target="_blank"><i class="bi bi-youtube"></i></a>
        <a href="https://twitter.com/home" target="_blank"><i class="bi bi-twitter-x"></i></a>
    </div>
</footer>
