Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1714006
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712913377; cv=none; b=YedwduSz0e4/hUsAlyYMO3gb2hdK7GlSZNbdje1kFAlZ6aTwIep27kwKLVULNRm9ZkDdEC8YDYx/FAqNrvrcBhvtXG97Wrnnfdd2fXV/165LThtdGUJNs1fVbRavaS65blgiDBkkoENTaAyHHz6McqlW/YEenuuBRvKzi5jWjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712913377; c=relaxed/simple;
	bh=T/TL4P6RqoXnShkICgxGFcoEXV/L8guRkl+BR8oz3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra6zP4ElDYTP0tsWtoX7uKraN2Fj4uGF707LCAB37cozdE29w55xB3xd0Zkby9UPN7Oxk8aI4me7VVNWYtCLWHY81VT6R6wmFuzna4JQkiyjs7UrcwtBGxUU1/s8fTQJDl39XoH8UbiIuUmOBH5IQfE0Rp1J+ShVeD6GTna4HPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnAbkM09; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnAbkM09"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56c404da0ebso974822a12.0
        for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913374; x=1713518174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=SnAbkM096rT3Vm/0q5mPIO+eXR+a1NgEWPKvc2JsKy3za7/Ve3cuc2slCp+gizuThO
         qITNxrLWemmBo0TLqo7sq6Rb1CiHfeHW1LonBWLhL/qOe9awJzS/dU6wDrfLzc34oBOW
         ExkA8wIKXhhXOVyMFxjfi6EnmC1LcA2UYJyos0CDjmSWXerekFK/tFOXb4c5WHfjwVcP
         jrgBZJ4ll9vWw71vYmy5QaEcuM7D5Yb/EvVfOGoqUetRFQfTC3tgVYj8CIr6sVmCnsm2
         5lu26oPYxA/y5r2F7GDuk32J05n9m0fOB1kS7ap+Nrq0oIz0+mPCeXrytZaWGnnu0aUt
         5aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913374; x=1713518174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=WSXekY++2K6c8ucu7blTtXSXqGkKBWkNaFsi1SU/TtIO+bVhCL2IPFZStUNubPsFxz
         1mbbyrkMhU8bNgEKyXeEvr66c1jINtCNvMvE3tN4CLdCZhGwqYL2RuuYaAiHPyvwyt51
         TmxKXkrtKbmS310efqtwTiWxyGeEgL86Xof1rAVMRQVim6PyQdtN5FuR8oKurZcAaLll
         Cr60Hac7GlGC4Yl2o2bpsqhoLemOXYBLQkj3ZoO+kz/X8LDMv1jn1+RXILAqd+WQMb6z
         ECwH/hbuA+1L4ubjuveOwUa68Kv+zDe+rHfgxbApTK1gAYQCTJpDRt+z2mh8GCsC5r4I
         Rx6w==
X-Forwarded-Encrypted: i=1; AJvYcCVC5fVZE5bvPrlxTJWQ+lW/PUw8Y7RkXD17N4BQm+RFR8HOOjWxwreaXTB+SWFqOsEuHc+ttK4NqP1y7wfD0OgbM5cBW3l4r+I5
X-Gm-Message-State: AOJu0YyRzWNsxyYT7GwIvZbYo1wqDyCHBiGpmIRSNrIaOCSjC9gLT0en
	rFBus0s+avUOmqs7w+zmWVO3+emxcChf3yjsUzttglzPFvj4XWYO
X-Google-Smtp-Source: AGHT+IF2JLt070H6U+NVwXUCGShMgUTVG3TFLf6L4pd2nPVSBBMwXn0qR7EXkAPf+SwG43RHlRZl8g==
X-Received: by 2002:a50:f68d:0:b0:56e:4039:add5 with SMTP id d13-20020a50f68d000000b0056e4039add5mr1892328edn.22.1712913374186;
        Fri, 12 Apr 2024 02:16:14 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
        by smtp.gmail.com with ESMTPSA id el9-20020a056402360900b0056fe755f1e6sm1454709edb.91.2024.04.12.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:16:13 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Fri, 12 Apr 2024 11:16:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zhj72l6uN9OFilxA@gmail.com>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be used
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memory
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +	EXECMEM_DEFAULT,
> +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> +	EXECMEM_KPROBES,
> +	EXECMEM_FTRACE,
> +	EXECMEM_BPF,
> +	EXECMEM_TYPE_MAX,
> +};

s/explcitly
 /explicitly

Thanks,

	Ingo
