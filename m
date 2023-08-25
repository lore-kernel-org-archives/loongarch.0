Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625317FC
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 07:40:02 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bd04558784so486019a34.3
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 00:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949201; x=1693554001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5r8bhhlGnXrx708tsGw6Ag8gm7AVkEO6BeDk4HD7tk=;
        b=Ll9NrDi/mijCIySZh1U48z73caOxcEgOA6NDVhaAlAk4C1e2zNKRgrLQECnxHaN0WN
         qPiIBq9iHFQys1gg6I8los5cKNggqPxZHsrvzwRWL5em5zNReV2ACjJEYSOnqzjRJHvs
         ca6m91mTUShcf4wJSNkzcY5QCs4IqKX+zvtGUUz3/QD8ouqhXkxbtqdGR4oLY1KYg8C7
         hI6nTo76AaLa112n/K00zLqh9iNZLQMsimCzy6ivtY9Iw1rfUjqbNvmfyoh5oPrNGXnF
         /mnx7TH54oZwGkOUJe/Md8UcgUTkM/B56lr2c8W5xV50bAmbt4OCsYQbgnGR1krca1dL
         EeXQ==
X-Gm-Message-State: AOJu0Yyfg1luZ8n/n7UlDwwvthI6so6xTNhFeo2PDcanxrDq1Z45LWcG
	G12q/yagnmnTo/9offID7KqSJ+Xv+ETEZtag
X-Google-Smtp-Source: AGHT+IEJF2OnKnmmm7/6fqkbdt72O5jycHjWOtFHR8B+9MXzKNMx9Ht4zVMsuXJUDRPQClxH5LtHsg==
X-Received: by 2002:a05:6358:2910:b0:139:b123:ae2 with SMTP id y16-20020a056358291000b00139b1230ae2mr20986047rwb.22.1692949200797;
        Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id l18-20020a637012000000b00563c1aa277asm859233pgc.6.2023.08.25.00.40.00
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so405725a91.0
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
X-Received: by 2002:a25:34cd:0:b0:d0b:5b6:4629 with SMTP id
 b196-20020a2534cd000000b00d0b05b64629mr19382891yba.46.1692949180028; Fri, 25
 Aug 2023 00:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
In-Reply-To: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Aug 2023 09:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
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

Hi Michael,

On Fri, Aug 25, 2023 at 3:31=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On 25/08/23 13:12, Martin K. Petersen wrote:
> > [11/17] scsi: gvp11: remove unused gvp11_setup() function
> >          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb
>
> I somehow missed that one ...
>
> The gvp11_setup() function was probably a relic from the times before
> module parameters.
>
> Since gvp11_xfer_mask appears to be required for some Amiga systems to
> set the DMA mask, I'd best send a patch to add such a module parameter ..=
.
>
> Do you know any details around the use of DMA masks for Amiga WD33C93
> drivers, Geert?

Doh, it's been a while, and I never had an affected system.
Probably it's needed on A2000 with an accelerator card and GVP II SCSI,
to prevent DMA to RAM banks that do not support fast DMA cycles.

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
