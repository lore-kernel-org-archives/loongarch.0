Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E2A4400
	for <loongarch@lists.linux.dev>; Mon, 24 Jun 2024 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719196002; cv=none; b=Gjgn67rOrSdTpja5iCyzLlvm1GxjX1kIrZ1YiocMnuHr1xXq+4ivj9hFOufPaBK7LTaDOATwCI1J1gkV6/wRm2ULzydNX+11FfXNEaLuocKtTOaDnyVNpW673FzE8oMrSu1tO3YVvJIN9Rtd1knHiOMnj0ATATBmLZII/BcnO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719196002; c=relaxed/simple;
	bh=VF6ss1E9xCanAEWNpbP5BdN9LJRvLeanmOYgYq+Fq4U=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QoqZTo4hK28DvqVX/SYobJf1rE1rkfUzYdLhEQujNecIUCBkBRY8r13fYoEx2pvl9MQye3wZAdRrrV6VxDHRnsMjbULEPSc0zgqI2Tj7VrffJWTustLTmvWtUinOb6KJGaEkyW5LfC1zwohvIDYnIgzmk01P8Tj/WWbwFi6IWOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W6sDP5dnlzxTFc;
	Mon, 24 Jun 2024 10:22:13 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 043F718007C;
	Mon, 24 Jun 2024 10:26:31 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 24 Jun 2024 10:26:29 +0800
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
To: Haibo Xu <haibo1.xu@intel.com>, <sunilvl@ventanamicro.com>,
	<arnd@arndb.de>
CC: <xiaobo55x@gmail.com>, <ajones@ventanamicro.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor
 Dooley <conor.dooley@microchip.com>, Andrew Morton
	<akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>, Baoquan
 He <bhe@redhat.com>, Evan Green <evan@rivosinc.com>,
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Zong Li
	<zong.li@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, James Morse
	<james.morse@arm.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck
	<tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Robert Richter
	<rrichter@amd.com>, Yuntao Wang <ytcoode@gmail.com>, Dave Jiang
	<dave.jiang@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-acpi@vger.kernel.org>
References: <cover.1718268003.git.haibo1.xu@intel.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <d9c996b8-fe36-1b69-331a-94eb2547cc0f@huawei.com>
Date: Mon, 24 Jun 2024 10:26:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)

On 2024/6/13 16:54, Haibo Xu wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.

Looks good to me,

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
