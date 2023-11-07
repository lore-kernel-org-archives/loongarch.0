Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664634CEA
	for <loongarch@lists.linux.dev>; Tue,  7 Nov 2023 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="VkzcfaSp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc4f777ab9so42736905ad.0
        for <loongarch@lists.linux.dev>; Tue, 07 Nov 2023 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379290; x=1699984090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=VkzcfaSpr5xCq81FhCig4PzxD49b4C18Sp8q1a839caGGK5rvyuR55c4GgBWhvV76G
         mf6W2IKFMskORhfXF30+STuIXHhlEIOwx+75mLvkwlb68eLC4l0UejW3Cx3zEIRC13wo
         kq7ob1c62AYWaJwd+GMU4ll2CVPE/AHnI4wvdH3nQclg9whGtCCG0SJ6Yv8LgWhPz0jX
         8FUJRq8XKp2UQY2DWmwIrs4r2XLhnLnZumeOmq6bQfbJYRUlOpYhGH84cSHqlQfe/YxV
         puLxXZ4Xtgx74k3oaKO6ECvRtjw1v9BVNVc1fwrxDTny5wdINBDdDCR4SwR93KXk+MTk
         89Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379290; x=1699984090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY15kIau+eDARAHjRIt1BbGYq8C7hJS6gitrNXYnQoM=;
        b=an82WrTN1uOVk/9ADmlMInAvftHDza9kPgDLxncETXLC5UhL4e3iPwfQIM0/xj5Nkb
         j3G06wINDLsG+T2R/EK5Eb51+WEQAW3+eNtKNK/Q19jAQ3Fck1BygW7HfHrTfWN2K5aF
         UxeIOt2ONLrYNs9CF7JpG2pG8+bFd2Yh2yOkOhoiS0Dz9tFuIWhjc+7e8b944it0+UTb
         WkDM/I/WDfJyy8hGr9X1aA6jNgfXmWHnocjv3DK8WYciDZ7YMlhxMI3/JpK9JuEuaLFN
         ULRgyVO+8sd1GjdNX4eDqVwf/BudoLAhWsY+GTDUjnrgFCEE2DlgAm7P0et8d1xGTb2c
         zIAA==
X-Gm-Message-State: AOJu0YxQO/AqScsA/yfBGRCLSgVGCLpHODmCkE+Blh/TMGZgoBbm959n
	a9znFPwJFGA+lq2WCuJMGugA0A==
X-Google-Smtp-Source: AGHT+IE1uUN1bCnM0e+Ov1l1naTtElUtLA3DgMMTfPPCXEEwKaTGd4dv0hVEl36p8Py1780zIW4h7w==
X-Received: by 2002:a17:902:ccca:b0:1bd:c7e2:462 with SMTP id z10-20020a170902ccca00b001bdc7e20462mr31928892ple.11.1699379290316;
        Tue, 07 Nov 2023 09:48:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b001b9be3b94d3sm102654pls.140.2023.11.07.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:48:09 -0800 (PST)
Date: Tue, 07 Nov 2023 09:48:09 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:48:06 PST (-0800)
Subject:     Re: [PATCH RFC 22/22] riscv: convert to use arch_cpu_is_hotpluggable()
In-Reply-To: <E1r0JMV-00CTyh-It@rmk-PC.armlinux.org.uk>
CC: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
  salil.mehta@huawei.com, jean-philippe@linaro.org, jianyong.wu@arm.com, justin.he@arm.com,
  james.morse@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rmk+kernel@armlinux.org.uk
Message-ID: <mhng-b535d186-b241-4fe8-a6b5-b06aff516d1c@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 07 Nov 2023 02:31:11 PST (-0800), rmk+kernel@armlinux.org.uk wrote:
> Convert riscv to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/riscv/kernel/setup.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f8875ae1b0aa..168f0db63d53 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -294,12 +294,9 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  }
>
> -int arch_register_cpu(int cpu)
> +bool arch_cpu_is_hotpluggable(int cpu)
>  {
> -	struct cpu *c = &per_cpu(cpu_devices, cpu);
> -
> -	c->hotpluggable = cpu_has_hotplug(cpu);
> -	return register_cpu(c, cpu);
> +	return cpu_has_hotplug(cpu);
>  }
>
>  void free_initmem(void)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
