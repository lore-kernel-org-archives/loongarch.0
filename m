Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2B2F5B
	for <loongarch@lists.linux.dev>; Sun, 21 Aug 2022 17:42:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k9so10701285wri.0
        for <loongarch@lists.linux.dev>; Sun, 21 Aug 2022 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=F0ptjTbxLv2NJaVf2gvBlBshDMfCokLJPPMsIV35UHBlxVECPPma43FPvPitouEYuo
         8dgtnhsmPRFBvIO948wmtVOueVdGaHu/6efegZ+eBz+dquE2oOi9XMsurik6HL7oB6MX
         jV8pUVxH3f1RrwF0NH6pncq2tH6AwoMHlp65ZDTNCyiT6v1mar/Hou3sFmBJRov6RKag
         O1el0UDp9u/+GhEvUUZhnnL+z+SJXn9IfDfG4Dlp/Iuz3gqoHz6wEPHD+abHkg+f2q3v
         w/lO0XWXR94cHio73ZqXyXjLv1uGE7J2Xgag56CksB4nH92y765Uk+pyJbn+nJIZ5N3k
         uDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=PccB4MpdrIskz8KqRIDi1Rdw/gc1OhzLyBFJbRMATLYvBD6E4pXrGT0CqWCv651h+4
         ezd2Mw0fLZwYxBUM0kB5fO/eGj9AKq1K0spRRpby6CPkw6NGcvFnKh7yakcY09Nx6Oky
         l8VB53hd1My4VVVTM0rhf+0117l4Xe8IDUX6Gbbmr6eZuiFbKokdR98+5mb5N6le9gF5
         XiNbGadTJcDGTJOjfDQoHDlieo89ZcUhCXSxDONidNboKrCXqAgQzrAlEPEzskYAtloe
         Effazucw4Ln3ZojuepLgwTY6TAV2bfBYUhZbEd2G7iqQVIo+2baAQhTwpw3JGWFkl/qc
         4Gbw==
X-Gm-Message-State: ACgBeo24dIACmiHB3sVN8wJkhe0naniWTVa37ZKlm3dDRDjxbvLwMUgX
	35B7h4lvaMtAw6Kyje969kY=
X-Google-Smtp-Source: AA6agR6ii5ETBOVbnXGvrEQ2XHp9wCOCZjRgmUsSrgmsT/hEBxdRm1IL0twc5nHL0nICTG/92OzUKA==
X-Received: by 2002:a05:6000:993:b0:222:d509:4b5b with SMTP id by19-20020a056000099300b00222d5094b5bmr9262211wrb.52.1661103772368;
        Sun, 21 Aug 2022 10:42:52 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003a643ac2b08sm6876286wmi.8.2022.08.21.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:42:51 -0700 (PDT)
Date: Sun, 21 Aug 2022 17:42:51 +0000
From: Stafford Horne <shorne@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
Message-ID: <YwJum2c1I8JhY0B8@oscomms1>
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>

On Fri, Aug 19, 2022 at 09:44:06AM +0800, Kefeng Wang wrote:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

>  arch/openrisc/include/asm/processor.h   | 1 -
>  arch/openrisc/kernel/process.c          | 4 ----

> diff --git a/arch/openrisc/include/asm/processor.h b/arch/openrisc/include/asm/processor.h
> index aa1699c18add..ed9efb430afa 100644
> --- a/arch/openrisc/include/asm/processor.h
> +++ b/arch/openrisc/include/asm/processor.h
> @@ -72,7 +72,6 @@ struct thread_struct {
>  
>  
>  void start_thread(struct pt_regs *regs, unsigned long nip, unsigned long sp);
> -void release_thread(struct task_struct *);
>  unsigned long __get_wchan(struct task_struct *p);
>  
>  #define cpu_relax()     barrier()
> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index 52dc983ddeba..f94b5ec06786 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -125,10 +125,6 @@ void show_regs(struct pt_regs *regs)
>  	show_registers(regs);
>  }
>  
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Copy the thread-specific (arch specific) info from the current
>   * process to the new one p

For OpenRISC bits.

Acked-by: Stafford Horne <shorne@gmail.com>
