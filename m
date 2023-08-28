Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917CA4A
	for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 06:43:14 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a8036d805eso2264660b6e.3
        for <loongarch@lists.linux.dev>; Sun, 27 Aug 2023 23:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693204993; x=1693809793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZAs6BPn0UEnVbrYLaaDeF3O9l7Iturm7FWJFQ5jda0=;
        b=fjN1uxOhnHzpS9tyyhUW51xRHpMbTjLrZVfhxfwDSbdneZOhVcRNhr0I/X7rt4IX4q
         RBAlOaIPC4zNt/+IdIOIcsHQ+5vNPkpRZg0BzER4zp1KAekzcqXuVOuJZnK5bnvXS/dQ
         Sgkfn1yfLgtd1xtA63cCmPcrATHrdZdKEVK8evCuQ4HUH2RkOO0vfJGBJ+mDVTKNeeFg
         WdeCkT/fkm7A/HjZbVEjGm1PtUNFBtnCAAu1vwWTYRCWKH4dAKMPzzfN0fF+Fht/zF17
         b8Imv50a8IxSGRSTmv5aO59yRlKAdkeyULla5PfS5r02bJlldNe0SC4MrAHA/J5pFH3r
         /taA==
X-Gm-Message-State: AOJu0YzAPKkb6ZV0iOqo1hJgzana/TbIikdztVpIc/s38Lk3igrJmwBa
	SiiOkVNPwHGJr7aqudIPzQlNvCCVIhX92A==
X-Google-Smtp-Source: AGHT+IFD/h1sorMV25Zhuh+F7zm7i29lT66YqfiS8jhER9eWvkEWozdf2BTxF8CHht8Mnd5ltG/3DQ==
X-Received: by 2002:a54:441a:0:b0:3a8:f3e7:d691 with SMTP id k26-20020a54441a000000b003a8f3e7d691mr9682879oiw.37.1693204993146;
        Sun, 27 Aug 2023 23:43:13 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id s40-20020a05680820a800b003a9a28f6ec7sm3063787oiw.52.2023.08.27.23.43.12
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6bf04263dc8so1026775a34.3
        for <loongarch@lists.linux.dev>; Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
X-Received: by 2002:a25:8502:0:b0:d7a:e348:1e47 with SMTP id
 w2-20020a258502000000b00d7ae3481e47mr3956815ybk.36.1693204971245; Sun, 27 Aug
 2023 23:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com> <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
In-Reply-To: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Aug 2023 08:42:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org, 
	Borislav Petkov <bp@alien8.de>, Max Filippov <jcmvbkbc@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 12:44=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.=
com> wrote:
> (Incidentally - did you ever publish the m68k full history tree anywhere
> in git?)

You mean the gitified version of the Linux/m68k CVS tree Ralf created
for me because my machine wasn't powerful enough?
No, and I should look into doing that...

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
