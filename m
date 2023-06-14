Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C161539F
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 09:29:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-653436fcc1bso5332331b3a.2
        for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 02:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734968; x=1689326968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0yjIX0KRuOC7G0fcJ6d1AuThz30GREhJw6MsawVV4o=;
        b=krdRFsXGnKXzkizptU5pKIhVPJT8SoF4NxB5bH/tmzJv0Ocuhuuv+L47iyYpLZyiP5
         Js0e35zV2q6L8fHFY1i8mGVqj9aqdXstGGHfrVWKWWnCPybdGzV0W/9JclN4vjZQmvfo
         sgzKX+Sjfh/RF7s4ic9yuxS06wAfZErslccydJmvaGQ5yogvtCO7RdllI2ww3TgamRAz
         +XCcLlsOkm4h0zugSnPftJNp/PcDpUGAeEdLeA5MtB14ZwGjnScqwNsTqdyLVYrtPa6u
         hi346Dgysve0ya+0Mm/SM5v3hhW2vTMBQOkFyFcf2N8KgyCcIJXMl/7Mt2xnIBFaN5mS
         RV0w==
X-Gm-Message-State: AC+VfDwhRXGPFBPotE2oz59g+vCip9c+hdmqOC70CfAN+UiqruChsEc7
	B3rS6jdJzI7IBXpTi8rx6L796wdjd5kElw==
X-Google-Smtp-Source: ACHHUZ5e22dJ2B+8YdeTjpD1h2iu3b1qT/8n1tpG3byZyOUN1PY7m9YWgokUp5uVN64qR7nu7sGfdQ==
X-Received: by 2002:a05:6a21:9991:b0:115:2b0e:3c3 with SMTP id ve17-20020a056a21999100b001152b0e03c3mr1117343pzb.19.1686734968524;
        Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id c26-20020a62e81a000000b0064d413ca7desm10250063pfi.171.2023.06.14.02.29.28
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6665f5aa6e6so243345b3a.0
        for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
X-Received: by 2002:a25:3249:0:b0:ba8:199b:9ec2 with SMTP id
 y70-20020a253249000000b00ba8199b9ec2mr1412111yby.31.1686734566067; Wed, 14
 Jun 2023 02:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230613223827.532680283@linutronix.de> <20230613224545.254342916@linutronix.de>
In-Reply-To: <20230613224545.254342916@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 11:22:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbBs5dE_Yi+gX8MNCqduP87S+w+T4B_JjVynbDyE=Waw@mail.gmail.com>
Message-ID: <CAMuHMdUbBs5dE_Yi+gX8MNCqduP87S+w+T4B_JjVynbDyE=Waw@mail.gmail.com>
Subject: Re: [patch 06/17] m68k/cpu: Switch to arch_cpu_finalize_init()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nikolay Borisov <nik.borisov@suse.com>, 
	"Ahmed S. Darwish" <darwi@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 1:39=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
