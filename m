Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52B31B11A
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597219; cv=none; b=IkwAMVqIX+7XlvZdtusUO4/WtfxD5glY2ujbNgBnmCXvLkCofJnKX7UfiKgtz9QKLKgZp6H3MAqZuVmHr9PX4kEgagIeuZtqE+zKNUI4dTbddp1D12t0IzqfAlJuMSCQgVb814Agm/voGPBLOWK6O9+CdfXE29aZVSzajmrGWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597219; c=relaxed/simple;
	bh=YEizIsE8/y/LtNcORPO8jldB4Nh5dJHp08eXLO5S9Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JmcwZt2oJcEMqXedKyv/+qZWbNqMs3iweV809fF1u/1URRgsQYE6hhFzdKJ1+apcyexL3bbfqtOTQEBmmD0Fb8kfl16YLkkSmub+0irwT33Gm/8lxzxI4RSyyaAKLae9hN9378elCIXl/Zz8pO84CothTsQndobi/I9FNwZ0g4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stHQxcMk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stHQxcMk"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso3488000f8f.2
        for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 02:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597214; x=1756202014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNam3s73jCkH5fp8vQUdOONkGiCMjeqztr8hoMDyHKE=;
        b=stHQxcMkNQ24pdhoMMjJwKQiLbtuD0GQ3YIQEvctGGTBEj/tgrZ6JLWCWH6h7ubkoU
         giaWj5RlFbw3wubYxU/3jGRxZijCpD8SECKzz85SdNWQMsNmLux8naNIdzl1FoX8SWOf
         o0602gaqA9BrjfvaXceNL2w2Kf3x3mY/5ib0YKmoQw/f/Vu4gnp+LkKqbp7ZTlMyv18g
         t4WE+p2IoGhJA89yIo2fcNSNYla38r99RinwfnkDJEYJ4qE/mwZk1FM4XD6aKB1T7O5x
         jy9Z/1k/6rKwPOZ4pXduB+/FFOAetOW6wyu+OiYxF3SK6N27j24bAfmDq2PqFunicME+
         IH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597214; x=1756202014;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNam3s73jCkH5fp8vQUdOONkGiCMjeqztr8hoMDyHKE=;
        b=mhRLL8dQF4dwOVRPJrKQ1Ed/bW/dm0HebOx0N344/2hixARdXDyQQ4ZTfT8dbG5+Hk
         eSy1F64G42LsSBqDGDbonbOnyeiEe7Y6WW9NWgOp1MlACEK5t0++z1tfXVhYISXift3s
         TP1pknrkd22cvcUgu1NG0/fakUlcc7TecfNnHva0hwhUV98mX+r1K8sxxgZf5YJTd2+a
         Uw6jA0Hh9a/CcEfqc47+WnmqH02d9vbKnh4mOPG5aH8HgA4+uOqncjqswoW17wQKSUhj
         gmibl/JDD65ExyGtcL2gVqpTjnHntK2mz1B3CrRHMUTYwnHh7smbNQSCfpnpXU8ps7Fx
         DVmA==
X-Forwarded-Encrypted: i=1; AJvYcCWbHTKrGuRE+DDlTqjq8ClwFGK/SKrYc4ZXxl2wwy8IQAdaPNfOLzYSWOqCKBFyds+Y7Dfc8M78s9A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Y82sKqH8Cto4C80wJ6wEqo6oPI5HwsEmfVRC45gtyCJvjFwU
	5OyfQvUF09BsnrmaPNXnIpGKN5/EfgM4Z79K1PzTSgAIxNULlGVVfK5fPyxPSEMYOPE=
X-Gm-Gg: ASbGncsbV+5vEFY2AfLXHD6msYllKru9gQFq/INegx7RPMVIE37bksr+sf+K8TjCudJ
	nHS5/caSmfHDnBZIMj/Y9mqBXEhQyo/BIL3eltyztsScf0P1UJJLzEgUDeqkWLSC0QyJ8SVC75g
	wRTPInjm6b3APvnMAPnqLv/r/0BXehQRAw86UwVDxmizS0li/qdFuI5mphtLDjE4E6vWMcU/ykI
	hNz1CymZLLbsvpUmgDX09eu8q6B0Usg6gYMFVRljlz8T7FkgHY6sNNr+wqOR0ZRAL8BDrTq9tUu
	DRlzP1HP5e8WFpQxgQxVFK5sMCBfEmD7Y5jY3LssIDIENkaf0nY711yuz3f/+vI9nO/uOoQFdgN
	iK8tusQU5PEr5RdD7CuXO5Gw/xrEaf2Qof7QlONw89Pg=
X-Google-Smtp-Source: AGHT+IFhVoXOXWz933OS2H4MYPh1tnFGv79hui+RhHHpUYqmH0GfWUAlyD1l4ealbPI6uEAVPOGUJg==
X-Received: by 2002:a05:6000:200d:b0:3b7:8832:fdd5 with SMTP id ffacd0b85a97d-3c0eaf4f6dfmr1431883f8f.16.1755597213853;
        Tue, 19 Aug 2025 02:53:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c16eesm3152017f8f.37.2025.08.19.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:53:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:53:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v9 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <202508191519.uT5io1jk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1809103a948545df93b7b439df46ca6393995aa1.1754999365.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250812-200258
base:   006aa8f57f55dd5bf68c4ada1e0d3f4e59027d71
patch link:    https://lore.kernel.org/r/1809103a948545df93b7b439df46ca6393995aa1.1754999365.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v9 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191519.uT5io1jk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508191519.uT5io1jk-lkp@intel.com/

smatch warnings:
drivers/mfd/ls2k-bmc-core.c:389 ls2k_bmc_pdata_initial() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +389 drivers/mfd/ls2k-bmc-core.c

71ff6b050ad788 Binbin Zhou 2025-08-12  360  static int ls2k_bmc_pdata_initial(struct ls2k_bmc_pdata *ddata)
71ff6b050ad788 Binbin Zhou 2025-08-12  361  {
71ff6b050ad788 Binbin Zhou 2025-08-12  362  	struct pci_dev *pdev = to_pci_dev(ddata->dev);
71ff6b050ad788 Binbin Zhou 2025-08-12  363  	int gsi = 16 + (LS2K_BMC_RESET_GPIO & 7);
71ff6b050ad788 Binbin Zhou 2025-08-12  364  	void __iomem *gpio_base;
71ff6b050ad788 Binbin Zhou 2025-08-12  365  	int irq, ret, val;
71ff6b050ad788 Binbin Zhou 2025-08-12  366  
71ff6b050ad788 Binbin Zhou 2025-08-12  367  	ls2k_bmc_save_pci_data(pdev, ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  368  
71ff6b050ad788 Binbin Zhou 2025-08-12  369  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
71ff6b050ad788 Binbin Zhou 2025-08-12  370  
71ff6b050ad788 Binbin Zhou 2025-08-12  371  	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
71ff6b050ad788 Binbin Zhou 2025-08-12  372  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  373  	if (ret) {
71ff6b050ad788 Binbin Zhou 2025-08-12  374  		dev_err(ddata->dev, "Failed to request LS2KBMC PCI-E IRQ %d.\n", pdev->irq);
71ff6b050ad788 Binbin Zhou 2025-08-12  375  		return ret;
71ff6b050ad788 Binbin Zhou 2025-08-12  376  	}
71ff6b050ad788 Binbin Zhou 2025-08-12  377  
71ff6b050ad788 Binbin Zhou 2025-08-12  378  	/*
71ff6b050ad788 Binbin Zhou 2025-08-12  379  	 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
71ff6b050ad788 Binbin Zhou 2025-08-12  380  	 * acpi_register_gsi() is used to obtain the GPIO IRQ. The GPIO interrupt is a
71ff6b050ad788 Binbin Zhou 2025-08-12  381  	 * watchdog interrupt that is triggered when the BMC resets.
71ff6b050ad788 Binbin Zhou 2025-08-12  382  	 */
71ff6b050ad788 Binbin Zhou 2025-08-12  383  	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
71ff6b050ad788 Binbin Zhou 2025-08-12  384  	if (irq < 0)
71ff6b050ad788 Binbin Zhou 2025-08-12  385  		return irq;
71ff6b050ad788 Binbin Zhou 2025-08-12  386  
71ff6b050ad788 Binbin Zhou 2025-08-12  387  	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
71ff6b050ad788 Binbin Zhou 2025-08-12  388  	if (!gpio_base) {
71ff6b050ad788 Binbin Zhou 2025-08-12 @389  		ret = PTR_ERR(gpio_base);

This PTR_ERR(NULL) is success.  It should be "ret = -ENOMEM;"

71ff6b050ad788 Binbin Zhou 2025-08-12  390  		goto acpi_failed;
71ff6b050ad788 Binbin Zhou 2025-08-12  391  	}
71ff6b050ad788 Binbin Zhou 2025-08-12  392  
71ff6b050ad788 Binbin Zhou 2025-08-12  393  	/* Disable GPIO output */
71ff6b050ad788 Binbin Zhou 2025-08-12  394  	val = readl(gpio_base + LOONGSON_GPIO_OEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  395  	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  396  
71ff6b050ad788 Binbin Zhou 2025-08-12  397  	/* Enable GPIO functionality */
71ff6b050ad788 Binbin Zhou 2025-08-12  398  	val = readl(gpio_base + LOONGSON_GPIO_FUNC);
71ff6b050ad788 Binbin Zhou 2025-08-12  399  	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_FUNC);
71ff6b050ad788 Binbin Zhou 2025-08-12  400  
71ff6b050ad788 Binbin Zhou 2025-08-12  401  	/* Set GPIO interrupts to low-level active */
71ff6b050ad788 Binbin Zhou 2025-08-12  402  	val = readl(gpio_base + LOONGSON_GPIO_INTPOL);
71ff6b050ad788 Binbin Zhou 2025-08-12  403  	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTPOL);
71ff6b050ad788 Binbin Zhou 2025-08-12  404  
71ff6b050ad788 Binbin Zhou 2025-08-12  405  	/* Enable GPIO interrupts */
71ff6b050ad788 Binbin Zhou 2025-08-12  406  	val = readl(gpio_base + LOONGSON_GPIO_INTEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  407  	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
71ff6b050ad788 Binbin Zhou 2025-08-12  408  
71ff6b050ad788 Binbin Zhou 2025-08-12  409  	ret = devm_request_irq(ddata->dev, irq, ls2k_bmc_interrupt,
71ff6b050ad788 Binbin Zhou 2025-08-12  410  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
71ff6b050ad788 Binbin Zhou 2025-08-12  411  	if (ret)
71ff6b050ad788 Binbin Zhou 2025-08-12  412  		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", irq);
71ff6b050ad788 Binbin Zhou 2025-08-12  413  
71ff6b050ad788 Binbin Zhou 2025-08-12  414  	iounmap(gpio_base);
71ff6b050ad788 Binbin Zhou 2025-08-12  415  
71ff6b050ad788 Binbin Zhou 2025-08-12  416  acpi_failed:
71ff6b050ad788 Binbin Zhou 2025-08-12  417  	acpi_unregister_gsi(gsi);
71ff6b050ad788 Binbin Zhou 2025-08-12  418  	return ret;
71ff6b050ad788 Binbin Zhou 2025-08-12  419  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

