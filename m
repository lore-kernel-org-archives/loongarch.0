Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EC3C22
	for <loongarch@lists.linux.dev>; Tue, 12 Sep 2023 20:31:25 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf1935f6c2so1790525ad.1
        for <loongarch@lists.linux.dev>; Tue, 12 Sep 2023 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694550685; x=1695155485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HS4AS8VbR5V4QhF/RUpoUXcwG9s1gQlJ8VLh2Gkpc+o=;
        b=DGYuYe04BkXP7sKg0pgDsvyxWcReWzsHSPXwZgBIMi57/R+uU3xUIrAyiWGZhfXJ9d
         ZA2thvkGxdO8ASoqwDnveeHSR3SPt6Ii/BHG/WqZnwBigwInh3cdcwpnck+tPbdnyPjt
         ChAPvrkmHJZfft04NCmZIwj1c9on27DDoFVVLDMYPQX3hewOpz2qClGOo6N88Q/Ff47w
         w+qzc+Gsys3ME9FaHDzTW8r3NHeL9nnet2J+cj6qFMYdX3Fq5+uqt3GBxJETrsAhHAiU
         5rWQq9+E8qw++vV5C4+kCvW9O7oUUXchriczbcRoCvK9U+J+9+nRGU9mh2kXSqfn/MKI
         yL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694550685; x=1695155485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS4AS8VbR5V4QhF/RUpoUXcwG9s1gQlJ8VLh2Gkpc+o=;
        b=DNecK51C+R/TS5T6MXEWI+uVOP1+AvX+1iGegx0VLbtwTEUSV4EjDFPbMASEEiM5Zo
         zIh18q+zwmHpYXyhQNH2Aszcd1BTwFnrZux81fwuVpNzrAgkO3XzLcdFjvg3NKTNbnxc
         klpqod+IuOXeMc2qMeB62ss8Rly/E8n7VhpIhp8oHjSiX/XQHCx4picl1Vv1WwVwXWca
         DfZXOSKOUdvodyOLOSxiNxl393TjN7Tif2ou1OnIUoLPBukU0vEkntd7ZQcPPu83DuHv
         S/y/aspsTnRQLUXbH/h4dOx6bhjoCMxqfEKtqDeiZfnzsUrP4mV/R9SzrBYHx0yffssC
         celw==
X-Gm-Message-State: AOJu0YyKv5rCGIo3PnmnvZqLg3I+30x2BcnZq0FlVaAcSy6MMntgZnkO
	PcRNJuliQlip35jFsUwP05A=
X-Google-Smtp-Source: AGHT+IF1jvtZNZztOXptTJDBThYNLnBm2KUZaXghQjZd7s8ArIIYzQTsJt4XtO34Zo2jt3bqD3AHDQ==
X-Received: by 2002:a17:903:1211:b0:1b7:ca9c:4f5c with SMTP id l17-20020a170903121100b001b7ca9c4f5cmr4456426plh.28.1694550684952;
        Tue, 12 Sep 2023 13:31:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001bb750189desm8912783plc.255.2023.09.12.13.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 13:31:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Sep 2023 13:31:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Helge Deller <deller@gmx.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Fix lockdep static memory detection
Message-ID: <9d0cb447-2556-4609-a96f-13875ddeeda3@roeck-us.net>
References: <ZQC5jS/Kc/JiBEOa@p100>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQC5jS/Kc/JiBEOa@p100>

On Tue, Sep 12, 2023 at 09:18:37PM +0200, Helge Deller wrote:
> Since commit 0a6b58c5cd0d ("lockdep: fix static memory detection even
> more") the lockdep code uses is_kernel_core_data(), is_kernel_rodata()
> and init_section_contains() to verify if a lock is located inside a
> kernel static data section.
> 
> This change triggers a failure on LoongArch, for which the vmlinux.lds.S
> script misses to put the locks (as part of in the .data.rel symbols)
> into the Linux data section.
> This patch fixes the lockdep problem by moving *(.data.rel*) symbols
> into the kernel data section (from _sdata to _edata).
> 
> Additionally, move other wrongly assigned symbols too:
> - altinstructions into the _initdata section,
> - PLT symbols behind the read-only section, and
> - *(.la_abs) into the data section.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 0a6b58c5cd0d ("lockdep: fix static memory detection even more")
> Cc: stable <stable@kernel.org> # v6.4+

Tested-by: Guenter Roeck <linux@roeck-us.net>

> 
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
> index b1686afcf876..bb2ec86f37a8 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -53,33 +53,6 @@ SECTIONS
>  	. = ALIGN(PECOFF_SEGMENT_ALIGN);
>  	_etext = .;
>  
> -	/*
> -	 * struct alt_inst entries. From the header (alternative.h):
> -	 * "Alternative instructions for different CPU types or capabilities"
> -	 * Think locking instructions on spinlocks.
> -	 */
> -	. = ALIGN(4);
> -	.altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
> -		__alt_instructions = .;
> -		*(.altinstructions)
> -		__alt_instructions_end = .;
> -	}
> -
> -#ifdef CONFIG_RELOCATABLE
> -	. = ALIGN(8);
> -	.la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
> -		__la_abs_begin = .;
> -		*(.la_abs)
> -		__la_abs_end = .;
> -	}
> -#endif
> -
> -	.got : ALIGN(16) { *(.got) }
> -	.plt : ALIGN(16) { *(.plt) }
> -	.got.plt : ALIGN(16) { *(.got.plt) }
> -
> -	.data.rel : { *(.data.rel*) }
> -
>  	. = ALIGN(PECOFF_SEGMENT_ALIGN);
>  	__init_begin = .;
>  	__inittext_begin = .;
> @@ -94,6 +67,18 @@ SECTIONS
>  
>  	__initdata_begin = .;
>  
> +	/*
> +	 * struct alt_inst entries. From the header (alternative.h):
> +	 * "Alternative instructions for different CPU types or capabilities"
> +	 * Think locking instructions on spinlocks.
> +	 */
> +	. = ALIGN(4);
> +	.altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
> +		__alt_instructions = .;
> +		*(.altinstructions)
> +		__alt_instructions_end = .;
> +	}
> +
>  	INIT_DATA_SECTION(16)
>  	.exit.data : {
>  		EXIT_DATA
> @@ -113,6 +98,11 @@ SECTIONS
>  
>  	_sdata = .;
>  	RO_DATA(4096)
> +
> +	.got : ALIGN(16) { *(.got) }
> +	.plt : ALIGN(16) { *(.plt) }
> +	.got.plt : ALIGN(16) { *(.got.plt) }
> +
>  	RW_DATA(1 << CONFIG_L1_CACHE_SHIFT, PAGE_SIZE, THREAD_SIZE)
>  
>  	.rela.dyn : ALIGN(8) {
> @@ -121,6 +111,17 @@ SECTIONS
>  		__rela_dyn_end = .;
>  	}
>  
> +	.data.rel : { *(.data.rel*) }
> +
> +#ifdef CONFIG_RELOCATABLE
> +	. = ALIGN(8);
> +	.la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
> +		__la_abs_begin = .;
> +		*(.la_abs)
> +		__la_abs_end = .;
> +	}
> +#endif
> +
>  	.sdata : {
>  		*(.sdata)
>  	}
