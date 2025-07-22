Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47D013A265;
	Tue, 22 Jul 2025 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753148029; cv=none; b=VO5UPmlTjr4fQwaht/m8Bfnf7RhLiroLW6DBJkp6n6Vz7wZzNiUlkTMGpyxOksZr/X6p9EsVobPPgFUl4HoFUxGcTjjviARAsCMqsRktLeMfCRrXxyN3yYJhZon4BOUBmUVPBWSpWqrv4gUTOpnet7gfPFrdyvka3mctixSwP9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753148029; c=relaxed/simple;
	bh=wp8zq+CwqXM4wW1l/Z2citGvtshsWLFeNika/T5VD7M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uFo9rWEk0pAnBxWa3fMzJopu8YrGD4RkyWPXa6dCitsqxAJ9B2yAy2Wn5ZkRogOJEo7fe6mOmwxERipintyQfc0it3/eescl+59sLPpmkBgGhz/ZYXmh4reYCai9mE47GspkfxTJBZWU/22lTjZNDDE9k8Fs3R/4XgMKQn5C2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxNHBt6n5o0EQvAQ--.30100S3;
	Tue, 22 Jul 2025 09:33:33 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxpeRm6n5oHzQhAA--.42270S3;
	Tue, 22 Jul 2025 09:33:28 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: Implement physical address with ELF program
 header
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250721091248.3896152-1-maobibo@loongson.cn>
 <202507220309.mDl9W32Y-lkp@intel.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <7a5789f1-d6a5-3892-98c1-2c4b8515459d@loongson.cn>
Date: Tue, 22 Jul 2025 09:31:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202507220309.mDl9W32Y-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeRm6n5oHzQhAA--.42270S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFyktw13Xw4fKr1DKrykJFc_yoW5KryUpr
	n5A3yqqr4jgr93Xw1DKF9ag34qqrnxWr42qa45J3Z3CFy7XF1jv3s7Cr9rWa42q34UKa10
	gFyrGayjya4UG3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CP
	fJUUUUU==

Oops, it is the obvious compile issue. And I am messed with parallel 
tasks and do not notice this, what I test is old kernel.

Regards
Bibo Mao

On 2025/7/22 上午3:19, kernel test robot wrote:
> Hi Bibo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 89be9a83ccf1f88522317ce02f854f30d6115c41]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-Implement-physical-address-with-ELF-program-header/20250721-171418
> base:   89be9a83ccf1f88522317ce02f854f30d6115c41
> patch link:    https://lore.kernel.org/r/20250721091248.3896152-1-maobibo%40loongson.cn
> patch subject: [PATCH v2] LoongArch: Implement physical address with ELF program header
> config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20250722/202507220309.mDl9W32Y-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220309.mDl9W32Y-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507220309.mDl9W32Y-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:15: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:18: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:33: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:34: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:41: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:46: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:47: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:50: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>     ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
> 

