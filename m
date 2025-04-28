Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0D1E3DD3
	for <loongarch@lists.linux.dev>; Mon, 28 Apr 2025 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877287; cv=none; b=MoLZk0k8XlLoh6PJzf2W9voCk86ASscgPdS1fcHnWLyBf2rtpXYprarWkROf9s7goPjxkyHlFFeF5TnIeDVPCgu39iCOY54ZwEWzyeAVo/fMvjno+icted03JOtNBehJVh3SQTurGdDS9aYrS01ulFVxUnUuuo7zzzXnvIoIIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877287; c=relaxed/simple;
	bh=I0D+24NhqEjNNCwy2eb6utOoFDrJBSYh2LEtPIvzec0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUuE0sNWdv7XB52FKt9/2vV2HHEZbvtRrO7dTH60FLpyj6lDiAxvxo7wmwehJk6noeTsKafbOB42LTE3p8h8jQgMOiBRIHUYgrrxQodIjIhekiq6uJRh9CN1opNcqbhazs4vZ1fbGrKS5trAPEtBIS8w3fWQwQ2+lqJoq6dclQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J1ZT+11W; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J1ZT+11W"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so5613322b3a.0
        for <loongarch@lists.linux.dev>; Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745877283; x=1746482083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=J1ZT+11W7aberooP9333CccZoNoP82SjtQxHXrA9CMILNnIXATMKqiQVwHlp7HhWrz
         Zrq6UDTOnIOMpUcDZ9BfrIIff2D9uyk+CEQLE7Gn+sDhmesdcPf0XWhJjOl88oEun4Ym
         1Wv/3MclnRk8Mn65jn5YgOO4or13baguay2XLhgllb8wOnae1YubdN05C34Q63bluyxG
         mwv5UwseLLYlV6kgnZPYtFc8VHq4bYzKOr7j+MSnfrEk62tASWuEuDiq2X+dsGWUjl/K
         a8l+vmsHRtOP4beeFqBhNU+l9VAAC+V9CkJILctT8O7l/bY9zpM3IYFb4tMogFTU1dFB
         FcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745877283; x=1746482083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=kUdCuYjStfT+uvxIql2fGB1aUB4LlmVN1ejdiiLrsJov1gBCTj0qD6BBRSsX9zvIin
         GSZWFRIVIZw+ij+MjPQ2RuNMpfORD6WjG8bxtJ3ok1v+ch/sUhva7VAAk9GFuZ0nimmQ
         MRiNOM2W99z//FsbuAkummy7ZBEYMNEFCKgZP+fLGRqFIEiBd7FMEEctAeVi7vDidXsw
         jmQsfe21kGfjrj1oZFIWIAaoczGwUCsdEONo7+6bdO1rMXdJcrOtP3yVjS/vKwmS5KMi
         9OxXjAugqEgxXzVnUAUE9SrexWaJkoY5Bi3AZEDMtEjc0e9K0ZV7I98Flk1B8yBjttYP
         vADA==
X-Forwarded-Encrypted: i=1; AJvYcCWTahR9p7pXwPJaiCsalcWlbfYpWR6dEgxCXceT6nS4jFY5pLLJnD9VORGF6+qICaDTGDE1nG5p6tM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPQOZLIpsmDLIaBaUrDMNEW98CMgy6UHUIXQ0HXanP99mXRTcr
	TaPCBmg+TIQACtpInZ+McOKp4nSES8JZvNjBL8IjB7EVVvtJbbSpkPHaO1Jcsjs=
X-Gm-Gg: ASbGnctu2DfTcTeAB4eH7Mn4oLrZfg2lRdDsTu8zIY+ikzBh3mG7NJU6bBoRon1jPnD
	x+sL7bOOC8n4GUT7ixjMbs0YYvLWCe870eZVtMtC8BfFMktJ7xwRX/dkAOc8mLvjyO7b/6cus3p
	qt6KorPWunVx108YalMzxuzOIaq0ES3cMwdepdt20l4O6jtoD43xt9g8HHr5QFaq4UmGtOS0fwq
	Vg3DVsLsIUzT8SMzlWPlKxDTeqgMdZK5610Sjx1mT1wphRt3AiOLztF62nzQ3uS0RjsxBJCwZKH
	jTZhC9ct2FfGZrEoicpFQTTxFYPeaSKcJJ4S
X-Google-Smtp-Source: AGHT+IGWT3F9rzHKTZtgpify0Emfhlu0qposGjyGuLHhHiqFNXMP110/wH5dDuLcBSTkm/pZT1KRBQ==
X-Received: by 2002:a05:6a20:9f44:b0:1fe:61a4:7210 with SMTP id adf61e73a8af0-2094f0854e6mr1162679637.2.1745877283395;
        Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5842:f05a:498b:82d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded547sm7735083a12.69.2025.04.28.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:54:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:54:40 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Message-ID: <aA_5IGGvXqB7v_EA@ghost>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
 <87frj613kz.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frj613kz.ffs@tglx>

On Fri, Mar 21, 2025 at 10:22:36PM +0100, Thomas Gleixner wrote:
> On Thu, Mar 20 2025 at 10:29, Charlie Jenkins wrote:
> > Similar to commit 221a164035fd ("entry: Move
> > syscall_enter_from_user_mode() to header file"), move
> > syscall_exit_to_user_mode() to the header file as well.
> >
> > Testing was done with the byte-unixbench [1] syscall benchmark (which
> > calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
> > x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
> > s390 a 11.1328% improvement.
> >
> > The Intel bot also reported "kernel test robot noticed a 1.9%
> > improvement of stress-ng.seek.ops_per_sec" [2]
> >
> > Since this is on QEMU, I know these numbers are not perfect, but they
> > show a trend of general improvement across all architectures that use
> > the generic entry code.
> 
> This looks sane now. I've bookmarked it as post-merge window material.

Has this been applied somewhere?

- Charlie

> 
> Thanks,
> 
>         tglx
