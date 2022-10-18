Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1C1FAF
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 07:37:17 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 101-20020a9d0bee000000b00661b54d945fso7156604oth.13
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 00:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwq8mRE5qiqVJEFTV8PMaTxlxiFl0HRvXCI1ESDIAgA=;
        b=nvdUqKjK1zCdwlttAZBtOU/WlxxCepJhoq4Qt25+AGkd9Y2bfWiv1iAMq5biX9odj3
         HFy4qyTr5EUmLrELN4zQXrklHZchfWiKYQQpQZ3FNddh9P+T/4NvklM9uzQGGeZqyUNP
         an7cQhjrDSpoaptcPp+2k2TWEbZCE/SyMCvugNOF0WahCH+jnhh7fOZybKyNp8y1aDjP
         xfW9a1Y4VR7xHEfih48wYQ8jBe1KKorgb08dMXxpyWYs/DxiaMs6JaFu2ODN6xRxd2D3
         /z6zLYtG2QNlDguU1uRzyB+5V7PzOYtXuMD7VwF7dja9ONBtAXvBU2pfCnjUcS1SPQ4y
         jyYw==
X-Gm-Message-State: ACrzQf3pR2l4qMV+BiXrAPL5mUqvfwA0WbvucYAVZ1HgxitMXLuYhszG
	XrQ49QPG69dT1o8vEFzrposLLl6OPU8YSou2
X-Google-Smtp-Source: AMsMyM6vitwih8ZlKYy482vcE5eZxBBeRNYm0oIKhS7DrrHbs+K/11FO3kR/ToC6pqT9HJvIdJz9tg==
X-Received: by 2002:a05:6830:1cc8:b0:65c:8e3:cfd with SMTP id p8-20020a0568301cc800b0065c08e30cfdmr750008otg.28.1666078636251;
        Tue, 18 Oct 2022 00:37:16 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id r4-20020a4ae5c4000000b004762a830156sm5074833oov.32.2022.10.18.00.37.16
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 00:37:16 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso7157692otb.6
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 00:37:16 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr1276352ywf.502.1666078253767; Tue, 18
 Oct 2022 00:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 09:30:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Subject: Re: [PATCH] mm: remove kern_addr_valid() completely
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
	linux-fsdevel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 9:25 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Most architectures(except arm64/x86/sparc) simply return 1 for
> kern_addr_valid(), which is only used in read_kcore(), and it
> calls copy_from_kernel_nofault() which could check whether the
> address is a valid kernel address, so no need kern_addr_valid(),
> let's remove unneeded kern_addr_valid() completely.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/pgtable_mm.h        |  2 -
>  arch/m68k/include/asm/pgtable_no.h        |  1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
