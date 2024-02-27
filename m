Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D45130AC0
	for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023537; cv=none; b=GE+rhsdZcXc5ROjujaaRxJmeoXzpQkrZD1QUZxC42Wg1anCxQe5ehrG5+2rDUnQpfOJwz1F3KvwWqyePtd7qL2yrbkgZZvWTH118Ge8RvUAcykO1FXyX49vA3SftpznfBZO+Jt+tzKnlzJP/Htj04BzbGKsy9+BHEzVOucrhoWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023537; c=relaxed/simple;
	bh=ZH6cCYrbNG2YOChcX3vTXEnEeEOKhVq2+yJTwt6+8Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btrqOsmYNMSyQl/BXdv2kZYGBq6H2Iz46S3flhtUjlGFsC7w0xCdCOmcPhQMGWqTJI6o5vH7UnHbXjW0BSed3rMx3EpOwLE6Tma9RbzPHp3qq5RBeZVTUbJjArHe/IhHXsoH0x4YgYBte5aimdq3RLL9bkO2SYwBqgmR9naMooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608ccac1899so35123957b3.1
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 00:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023534; x=1709628334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzwNvfzqcMx0O3hVp46LgRJMNTPfRBstut9NEe744kY=;
        b=QnIYZFh/7rRO/w9Ism615kHlyHDJ6fUAhqrm4rV9s9TTbfOBuvE/tPAyFLGr/Xjpl2
         OwPY+2mQdWEmEstXzIfIsFbUTaff4q2biuIKfwWshBtooTW4sBwvAnRUkqwg3D8jSsuo
         I/DqqF6Eupg8vN65CDF5iYBQbBKnTazh5TRSsaaw5GMA9azXDOyls3vpVcxXtTr+Lqpu
         m1RWhbANZMR5JSSgafvTsg/Jy9l/UP0mkd2PIYmJ7uWstbRu7VS6MzE0r54UkB9b88W6
         fb6BXLkUOQz5Tu5sxmCs0eqY545ACUx5a4HR/OaFbzrGGps5AzkM0SjgBJZrY00DRWXL
         +ikw==
X-Forwarded-Encrypted: i=1; AJvYcCUe/nrcao/OyfKHKP+9nmyINcGol8q38XRuOmmB66WisI8a7976yJeb2i/4sBpJqbvjsSk94Iu5HfNg61OE6OXM2W2UFPkBkyW3
X-Gm-Message-State: AOJu0Yy4U0/qPdzAFFRFouMsp0JInPmcM9+1g1F0TEiIx6uRMVaC1lSE
	HYL96E8VxvfCRBdGj3gHepYJL1dJ6CEu7q64MMRrS/EZs3Vyr3IKNJjY65MSg/P8LQ==
X-Google-Smtp-Source: AGHT+IGWu1xI2y13o/8KSI4NxGShgbS+u5EKIQg/l88SoyM/E8euZ+Y5QMSUQfTnL6USPGOigVvMZg==
X-Received: by 2002:a81:a988:0:b0:608:8f22:d6ad with SMTP id g130-20020a81a988000000b006088f22d6admr1426189ywh.47.1709023534301;
        Tue, 27 Feb 2024 00:45:34 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id pc34-20020a05620a842200b00787da4c568asm1308612qkn.20.2024.02.27.00.45.34
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:45:34 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-787b4d1393aso256247185a.0
        for <loongarch@lists.linux.dev>; Tue, 27 Feb 2024 00:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdk2YlZ6hTWyAI3fS7kNUy4aXlCN+vX8c+KrmUrQrQOZ0NVn4gKsDh+ZqotApZCS3vpo2m6ltRdRe5yyoLqDqjdiQFSMy2IqdO
X-Received: by 2002:a25:84c7:0:b0:dc7:496e:42e1 with SMTP id
 x7-20020a2584c7000000b00dc7496e42e1mr1414712ybm.51.1709023513209; Tue, 27 Feb
 2024 00:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-2-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:45:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Feb 26, 2024 at 5:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/Kconfig
> +++ b/arch/Kconfig

> +config PAGE_SIZE_4KB
> +       bool "4KB pages"

Now you got rid of the 4000-byte ("4kB") pages and friends, please
do not replace these by Kelvin-bytes, and use the official binary
prefixes =3D> "4 KiB".

> +       depends on HAVE_PAGE_SIZE_4KB

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
