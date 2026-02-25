Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5E826463A
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 03:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771989869; cv=none; b=pB1Xu2nZfxRKSjYyx/QoXeMY7PmpCqBnRGAf6V+FLfcyVT3h1QYng7K+IBBjhZurBChk2LcFCNPPbg5f0LP5oov3VbvYfUWtU+r2d07DUEDzBNKuoluPLlzPXe27f6RHsoZoIpou8LpWB9IMZpi9W9TP/RYHEt1VM2jmaGZVCs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771989869; c=relaxed/simple;
	bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=maRt65iJz9FDM8Hmh9TZ8CC6vp7RucyjE/3BbvXsCbh1kzy++71pZHeeb1NNbtcbUxbYJj4woaHA80llTys8h6rMGUzliGcy/EX1USib+sb5+dq8+fjdIkyPDKJd1LcrSHlbKwl3/v+m67/7w9HXERcwU1KZPcCHqnQiG4ax5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzLdG0L2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzLdG0L2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-354c825dc77so2797891a91.0
        for <loongarch@lists.linux.dev>; Tue, 24 Feb 2026 19:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771989867; x=1772594667; darn=lists.linux.dev;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=WzLdG0L2SDvKjLJqQ/QdrBf3HCA66rwTrnuWE5Dt12pnSYwTcoDLuRDwrcrMox8wfx
         sV7qxVdBjZAT5iKmyuctdDbXRvTs8d947ZR/kQF9gk0V2qiMXLACX2ZTdQGSPF51d9ph
         hSTIUEWR6hX68VM3q7k5dR1JEDB4Ivw4QOrQ2nM2L/hARzU6Bl3LFyFYhJCTyhYqoVde
         fi/OrSjn0vWED923VdcvoJ2zWfWonjKaiObFLGl3ZkQhEhAtxtvgN4xY40QVYQl89Kxp
         oFqeiujNpwqss9HeEqu7j/Uo9XoVkLbGlr/BCkTbaubTWd5dFHdNh7/BX81N+lZciors
         62kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771989867; x=1772594667;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=XAqGCUf8ki3ShzMIC4hH7qOTEUcFXfioOvGHZT5aVU1QyyQQbA4bVBG0ZCRGwYAQ7e
         SLIR2LcPk6ZwnY5KF/Gt2MFQjAP4x8Yg/Lq1faOWmFHlr5P1N4ql6kydPcThhTKx+DIm
         vikEqirJVDFZB5L8Tovr1l7WZw2R3NbxuxVPZFW+88i4xUZrykrri98DQasSVfkYgWH9
         FxpHlxYkeVZQ41qic5bdyeMu18vg0gWNMbCuddww9PWRzwN6jY/ZLRGQpodWUUioFW/8
         BIOnOkBGBhVk8ZqRcR2tjr/V29W4HB77E4kuJGLx6jukL5c/CBZJCsqNg9nsnBg6sPva
         XtVg==
X-Forwarded-Encrypted: i=1; AJvYcCUKuxDE+svIMggDxTsGDbvJcTJbDh8miqaKSGgA40YXoQT32j7FyoFoWgU4ET+b9H89yeX1FVJpKlM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiVv8ZAuNZkm3lvnIMgtabZytqmLERSZeFUfIPb87WstCfT2/m
	txKruvUn6UFYlGTR4QfNneVxJihNFjTVk957rc8YZANA8QZLu/h2jhRN
X-Gm-Gg: ATEYQzwvK3xpabjKAGOTglOay0a9F8sMKnGr0mLdYtWgy1FGe8ki2B/oH1La5pSIKIA
	V8vcs2bBajyf4gjvVB+ROn1rW6401eRlh957nRps+Xtl8ZakC4PsKh8nkUZHEoMj9NaD5CYkSz9
	BHBGKpcY/GxGXs4NEy51wCVBRyAqViBWR65lRJg/pVUVn7pVXSTAc1TLlc51QP25j74+sZAaaWi
	f5pVPI8fT5hvNPxK/gKBVtuDSSbeJxPUk3jHg1aX9pLVmCVpciUBtrmB9AfI/ZLcHx/c4KcRQXE
	2L2E9pPS+jAotgGZ4TXf4mDsEYSTPhQ7QiNlg62yIY1wE3RQvts38kfxVdrmfyfMIdQsaKIruh5
	o3Rt38zwjJBwyNWmJ4vu+JumykJj+sQlgPgP8X4OE0DNSL7J7OtgnIlFRVwjc1zd6A8TXGK/2ky
	Dy4dCj2XSCAcehHoLunw==
X-Received: by 2002:a17:90b:2cc5:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-358ae7c5003mr12522694a91.4.1771989867018;
        Tue, 24 Feb 2026 19:24:27 -0800 (PST)
Received: from dw-tp ([203.81.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm1092824a91.16.2026.02.24.19.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 19:24:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org, 
	bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	pmladek@suse.com, dapeng1.mi@linux.intel.com, kees@kernel.org, 
	paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org, 
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com, ryan.roberts@arm.com, 
	sourabhjain@linux.ibm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
	hbathini@linux.ibm.com, songshuaishuai@tinylab.org, samuel.holland@sifive.com, 
	kevin.brodsky@arm.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	coxu@redhat.com, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, 
	jbohac@suse.cz, brgerst@gmail.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v6 1/5] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
In-Reply-To: <20260224085342.387996-2-ruanjinjie@huawei.com>
Date: Wed, 25 Feb 2026 08:45:56 +0530
Message-ID: <87wm01h5sj.ritesh.list@gmail.com>
References: <20260224085342.387996-1-ruanjinjie@huawei.com> <20260224085342.387996-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
>
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.
>
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>


I had gone through the generic implementation v/s the powerpc specific
remove_mem_range() implementation, when it was posted by Sourabh
separately. And it make sense to use the generic implementation in this
case, rather than keeping a duplicate powerpc specific version. So...

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

