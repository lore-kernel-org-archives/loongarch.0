Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03061C69E
	for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="Y9fau6mV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso24635275e9.0
        for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1705423497; x=1706028297; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfgzSOT5YsRlYZszh8CGN3Yrxu5fn/m7q+vPcIoOkRo=;
        b=Y9fau6mVd6t97qI5l9h9k8xjY6N0YDtUVpf/X/bnImWFAe5b+X5Q6rxU9cyJUEn8Fu
         1RvNaN2yqGIkHEB4fnBbjSg6+RDENzgwbV5P/E/XwJjWSoIdxmFnYgmEamzi4cJKsSj/
         +BwJgZvhzrCGORCTTstUb/1gW85hHHBhJT5eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423497; x=1706028297;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfgzSOT5YsRlYZszh8CGN3Yrxu5fn/m7q+vPcIoOkRo=;
        b=h3+SO31nliZPxhPxeWnp7mijX/iBn/Q9Kgzb9scrCv+fTJC5yunc26lDTsogrJ7fLY
         6wT94kk/afD2Ksopi78cfbXaBylD7wNZvBcTDjAkwKdCctWOwbxsR8bHacfUu7KoO2Yu
         Qy7aExwUAzTp3ywMRcf2fdHpl3+kEYPcIFBdvz7dSyGJtNl420b6s06dIt1e7VfNxNRU
         Qx4YmqrqZcSzaxwjTNU6J1FI/fSnWHKHPrfGvJHS3WR/06krAIZy6nm/Tb3CU6m3agTO
         92OIz9eMvLsM47ABxNxILHq+oNmjroVuJwGAUl9HsxwbSXeeeLOwKNvyzSCjiSzTo119
         2p5A==
X-Gm-Message-State: AOJu0Yxrz36VpmZSqr52zBPLTbdcQikpLsmOKQA5KJMB/DLRP9IHCEuk
	QSZ1f9W2y/mO5ElSqq2QfjRbqN3rNOmQHQ==
X-Google-Smtp-Source: AGHT+IGLlTqH9WZOC/OME4zoyjXAaxL4iv39bxZRTYkDmE8GGBdCKiSNb+tybKwAFnn9zCLTCDPSJg==
X-Received: by 2002:a05:600c:4d1f:b0:40e:5b54:1f6e with SMTP id u31-20020a05600c4d1f00b0040e5b541f6emr3393949wmp.131.1705423496977;
        Tue, 16 Jan 2024 08:44:56 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b0040d8d11bf63sm19929191wmb.41.2024.01.16.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 08:44:56 -0800 (PST)
Date: Tue, 16 Jan 2024 16:44:55 +0000
From: Chris Down <chris@chrisdown.name>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <Zaayh527V881l8tf@chrisdown.name>
References: <20240112193103.3798287-1-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

Yosry Ahmed writes:
>The z3fold compressed pages allocator is not widely used, most users use
>zsmalloc. The only disadvantage of zsmalloc in comparison is the
>dependency on MMU, and zbud is a more common option for !MMU as it was
>the default zswap allocator for a long time.
>
>In hopes of having a single compressed pages allocator at some point,
>and following in the footsteps of SLAB, deprecate z3fold. Rename the
>user-visible option so that users with CONFIG_Z3FOLD=y get a new prompt
>with explanation during make oldconfig. Remove CONFIG_Z3FOLD=y from
>defconfigs.
>
>Existing users, if any, should voice their objections. Otherwise, we can
>remove z3fold in a few releases.
>
>Signed-off-by: Yosry Ahmed <yosryahmed@google.com>

Acked-by: Chris Down <chris@chrisdown.name>

Thanks. We are definitely hurting users as well by keeping this around with its 
known issues when writeback is disabled, for example.

>---
>I have limited understanding of Kconfigs. I modelled this after commit
>eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
>but one difference is that CONFIG_Z3FOLD is a tristate. I made
>CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
>so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
>am not sure if that's the correct way to do this.
>
>---
> arch/loongarch/configs/loongson3_defconfig |  1 -
> arch/powerpc/configs/ppc64_defconfig       |  1 -
> mm/Kconfig                                 | 13 +++++++++++--
> 3 files changed, 11 insertions(+), 4 deletions(-)
>
>diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
>index 33795e4a5bd63..89b66b6c6a1d5 100644
>--- a/arch/loongarch/configs/loongson3_defconfig
>+++ b/arch/loongarch/configs/loongson3_defconfig
>@@ -85,7 +85,6 @@ CONFIG_ZPOOL=y
> CONFIG_ZSWAP=y
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
> CONFIG_ZBUD=y
>-CONFIG_Z3FOLD=y
> CONFIG_ZSMALLOC=m
> # CONFIG_COMPAT_BRK is not set
> CONFIG_MEMORY_HOTPLUG=y
>diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
>index 544a65fda77bc..d39284489aa26 100644
>--- a/arch/powerpc/configs/ppc64_defconfig
>+++ b/arch/powerpc/configs/ppc64_defconfig
>@@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=y
> CONFIG_PARTITION_ADVANCED=y
> CONFIG_BINFMT_MISC=m
> CONFIG_ZSWAP=y
>-CONFIG_Z3FOLD=y
> CONFIG_ZSMALLOC=y
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=y
>diff --git a/mm/Kconfig b/mm/Kconfig
>index 1902cfe4cc4f5..bc6cc97c08349 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -193,15 +193,24 @@ config ZBUD
> 	  deterministic reclaim properties that make it preferable to a higher
> 	  density approach when reclaim will be used.
>
>-config Z3FOLD
>-	tristate "3:1 compression allocator (z3fold)"
>+config Z3FOLD_DEPRECATED
>+	bool "3:1 compression allocator (z3fold) (DEPRECATED)"
> 	depends on ZSWAP
> 	help
>+	  Deprecated and scheduled for removal in a few cycles. If you have
>+	  a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, please
>+	  contact linux-mm@kvack.org and the zswap maintainers.
>+
> 	  A special purpose allocator for storing compressed pages.
> 	  It is designed to store up to three compressed pages per physical
> 	  page. It is a ZBUD derivative so the simplicity and determinism are
> 	  still there.
>
>+config Z3FOLD
>+	tristate
>+	default y
>+	depends on Z3FOLD_DEPRECATED
>+
> config ZSMALLOC
> 	tristate
> 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
>-- 
>2.43.0.275.g3460e3d667-goog
>
>
