Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A1B20C015
	for <loongarch@lists.linux.dev>; Wed, 16 Oct 2024 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089673; cv=none; b=CiTiOjg7MgMfWs7c9Fd4gSfzbI6fg0OaXER5tRhSPJZyhRfQu462y5RYmEgwn1z6cqeht3dCB5f1KZ/a8zvQ8093oxVLKkztJDIdA1nUTttGiIY8pN4UoKnHphBkXAWDJwGoeRJ20jtTHM6/8BRYKyzyfbo3IqS+zYLK2Xb506o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089673; c=relaxed/simple;
	bh=cFm6C9yHF4d5EJsvTt2L486kzgO4ydnk8peQ4k2qH0U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/4BegeEvNWQ4kxPwHn8xuTV8hTgfanu8rM6VfK5CBKHWJL44Vf2eULPjg7eYGOKbgz1NsJk0y/rHUe65d2T3R/LU9bJhzZ20qHsRx2pADQlByf8t3fb9GkSwAXqYoWl3Byz+50TZZYfvkGfpfXI3DuLl2n7JbJycFQ4oSDpOEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI2zdCR4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI2zdCR4"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so34655401fa.3
        for <loongarch@lists.linux.dev>; Wed, 16 Oct 2024 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729089669; x=1729694469; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNOEBHIW89c1j/jhsHn9BJm63iz+XQaKnsI8oRx93vU=;
        b=LI2zdCR4FWpal02culWSzu1VV6Ttn/fTtFWov7n/Y9JfNmgz6Aid08WoOIalNjLdoC
         wZaE5EI/a7BvcsE3hw7AtBkrEElu021i3ALtATe3vfwZvrNOnJtUMD5K3v22oGKVeBcM
         qVrG8pxEdn9UeojgTRa1Wqj3vL7x2IvntkuRT7PfKna4fvVQZW/ZESQ9xL5WrLtEbf2b
         BJx2DKlHECePKrwmer9CxiWfAOl5S6rppIVxQQBkGJfJoKRbTfSRo9W7DQdAywcAYzur
         iH2PCw8XuWkMp8xwEXFKEK4wmaA+P7qCy2AtIU7ktcK2e3KBpy1NnDh0nT3UOkjW8LSb
         Zwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089669; x=1729694469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNOEBHIW89c1j/jhsHn9BJm63iz+XQaKnsI8oRx93vU=;
        b=BEQL2bm1ar9+hkGRdOaAzN1iDOkfXYR53/fUCc8wowWZiaAtIXRDv2WYoETO4M2x87
         VcCoQbfn5EOo+dhvEy9laDrULM45OdEj0ftdHaMopZPjCq9AgxxLO7/Vuw2IDj0tmEpd
         doTwA8CoFjKNYdEFU1H4IZQfrUSb+G1SQiD3hFvBzobZeNCH7+wDiq/7oh3O7EiN3Ga1
         cYWgyBeNXfzdSeWOraSmA7NJAv2TXRxKd+zeHI4YFVZByu92xpeJPNa2C0uzYSEAJSwt
         FZk0Z10LvUGrp4908e74xmkCGWzLOuyVpG3zP90Hj/C1GK9jYcbArHxo0oOWcbCVb3WZ
         ggZA==
X-Forwarded-Encrypted: i=1; AJvYcCWSPaRjIxgspMnl4qBTxSH7xCY3ylIfYaUozF42n5sPz/xSRfnXc0xwyICnjrP585RnlV+7e2cdUw8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLF8gb5qecGm5VPRXakCTYIxrg+H6OE4m6vKDUAS/JIRWhRBBD
	2s6s/Fa5xsEQh4UJrlryK8ZzwOmtXY6gTy8CW7cOz0TuRsDOzoSL
X-Google-Smtp-Source: AGHT+IEQ2b77do+Ei5H+uRLYrEtNQq0NK3oK0wCc+2cFtuWRuK/aQBOOdJJvL1LeKTNOBzUMcJr/yQ==
X-Received: by 2002:a05:651c:1989:b0:2fb:6181:8ca1 with SMTP id 38308e7fff4ca-2fb61b37a76mr33036831fa.6.1729089669341;
        Wed, 16 Oct 2024 07:41:09 -0700 (PDT)
Received: from pc636 (host-95-203-1-67.mobileonline.telia.com. [95.203.1.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d1d0244sm4327361fa.139.2024.10.16.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:41:08 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Oct 2024 16:41:03 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/8] mm: vmalloc: group declarations depending on
 CONFIG_MMU together
Message-ID: <Zw_QfzopOv7pCZc_@pc636>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-2-rppt@kernel.org>

On Wed, Oct 16, 2024 at 03:24:17PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> There are a couple of declarations that depend on CONFIG_MMU in
> include/linux/vmalloc.h spread all over the file.
> 
> Group them all together to improve code readability.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/vmalloc.h | 60 +++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 36 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index ad2ce7a6ab7a..27408f21e501 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -134,12 +134,6 @@ extern void vm_unmap_ram(const void *mem, unsigned int count);
>  extern void *vm_map_ram(struct page **pages, unsigned int count, int node);
>  extern void vm_unmap_aliases(void);
>  
> -#ifdef CONFIG_MMU
> -extern unsigned long vmalloc_nr_pages(void);
> -#else
> -static inline unsigned long vmalloc_nr_pages(void) { return 0; }
> -#endif
> -
>  extern void *vmalloc_noprof(unsigned long size) __alloc_size(1);
>  #define vmalloc(...)		alloc_hooks(vmalloc_noprof(__VA_ARGS__))
>  
> @@ -266,12 +260,29 @@ static inline bool is_vm_area_hugepages(const void *addr)
>  #endif
>  }
>  
> +/* for /proc/kcore */
> +long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
> +
> +/*
> + *	Internals.  Don't use..
> + */
> +__init void vm_area_add_early(struct vm_struct *vm);
> +__init void vm_area_register_early(struct vm_struct *vm, size_t align);
> +
> +int register_vmap_purge_notifier(struct notifier_block *nb);
> +int unregister_vmap_purge_notifier(struct notifier_block *nb);
> +
>  #ifdef CONFIG_MMU
> +#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
> +
> +unsigned long vmalloc_nr_pages(void);
> +
>  int vm_area_map_pages(struct vm_struct *area, unsigned long start,
>  		      unsigned long end, struct page **pages);
>  void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
>  			 unsigned long end);
>  void vunmap_range(unsigned long addr, unsigned long end);
> +
>  static inline void set_vm_flush_reset_perms(void *addr)
>  {
>  	struct vm_struct *vm = find_vm_area(addr);
> @@ -279,24 +290,14 @@ static inline void set_vm_flush_reset_perms(void *addr)
>  	if (vm)
>  		vm->flags |= VM_FLUSH_RESET_PERMS;
>  }
> +#else  /* !CONFIG_MMU */
> +#define VMALLOC_TOTAL 0UL
>  
> -#else
> -static inline void set_vm_flush_reset_perms(void *addr)
> -{
> -}
> -#endif
> -
> -/* for /proc/kcore */
> -extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
> -
> -/*
> - *	Internals.  Don't use..
> - */
> -extern __init void vm_area_add_early(struct vm_struct *vm);
> -extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);
> +static inline unsigned long vmalloc_nr_pages(void) { return 0; }
> +static inline void set_vm_flush_reset_perms(void *addr) {}
> +#endif /* CONFIG_MMU */
>  
> -#ifdef CONFIG_SMP
> -# ifdef CONFIG_MMU
> +#if defined(CONFIG_MMU) && defined(CONFIG_SMP)
>  struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  				     const size_t *sizes, int nr_vms,
>  				     size_t align);
> @@ -311,22 +312,9 @@ pcpu_get_vm_areas(const unsigned long *offsets,
>  	return NULL;
>  }
>  
> -static inline void
> -pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms)
> -{
> -}
> -# endif
> -#endif
> -
> -#ifdef CONFIG_MMU
> -#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
> -#else
> -#define VMALLOC_TOTAL 0UL
> +static inline void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms) {}
>  #endif
>  
> -int register_vmap_purge_notifier(struct notifier_block *nb);
> -int unregister_vmap_purge_notifier(struct notifier_block *nb);
> -
>  #if defined(CONFIG_MMU) && defined(CONFIG_PRINTK)
>  bool vmalloc_dump_obj(void *object);
>  #else
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
