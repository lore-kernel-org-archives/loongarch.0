Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83AE2555B
	for <loongarch@lists.linux.dev>; Thu, 13 Jun 2024 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245241; cv=none; b=mhz0Lg8OlKcyFbQJh8LRiwNOgxdpiuGMVQdv5qPHbLP+qIgqbfZChYCwErbcUgKr89+nBrFPxyo7+AKMCVmG/3WkOn6ko8VSvlQVMtXoUbF/MzIuFw8oUngyjRm/QqrdjVO1xWufCq/f6pC4/bTczQzdVkRi5lforuwhySbktC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245241; c=relaxed/simple;
	bh=NrB1tWFuIhfmrmOs66MYBHQVmBB3oACaTlrPzQkS7dA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aQaadHStYdOPIzJlpjfS3WL5n5ZanK9zD33v8PladEYvjtSSB9Fvb9g2r+aTxzjDHXNR0ckc+RjbC84SbwTluTZkiN13ooe8jj9Hi+MiBc++yQwINJ80YgM5pzBln+0wTWssne15tlhsr17LY9+ZXJcyJMtqFtbluXwlc/2Rlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8Bx3+t0V2pmEUEGAA--.9672S3;
	Thu, 13 Jun 2024 10:20:36 +0800 (CST)
Received: from [10.180.13.176] (unknown [111.207.111.194])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx78dvV2pmVgceAA--.8207S3;
	Thu, 13 Jun 2024 10:20:32 +0800 (CST)
Subject: Re: [PATCH v2] PCI: use local_pci_probe when best selected cpu is
 offline
To: Markus Elfring <Markus.Elfring@web.de>,
 Huacai Chen <chenhuacai@loongson.cn>, linux-pci@vger.kernel.org,
 loongarch@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240605075419.3973256-1-zhanghongchen@loongson.cn>
 <9bf241c5-68af-4471-a159-1c673243d80d@web.de>
From: Hongchen Zhang <zhanghongchen@loongson.cn>
Message-ID: <d36de70b-3052-71eb-fdb4-c09256ff3b96@loongson.cn>
Date: Thu, 13 Jun 2024 10:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9bf241c5-68af-4471-a159-1c673243d80d@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx78dvV2pmVgceAA--.8207S3
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/1tbiAQAHB2ZqUJQAbQABsl
X-Coremail-Antispam: 1Uk129KBj9xXoWruF1kZryruw1fZFWkKr43CFX_yoWkWFc_uF
	n5GFs7Z3yqyr1DXanYkrsxuF98Wa17AFySyw18JFnF9w15J3ZxAayUJry5Aw15X34a9rn8
	C3WYq3y093W3uosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUU
	UUU==

Hi Markus,
   Thanks for your review.

On 2024/6/13 上午2:08, Markus Elfring wrote:
> …
>> This can be happen if a node is online while all its CPUs are offline
>> (we can use "maxcpus=1" without "nr_cpus=1" to reproduce it), Therefore,
>> in this case, we should call local_pci_probe() instead of work_on_cpu().
> 
> * Please take text layout concerns a bit better into account also according to
>    the usage of paragraphs.
>    https://elixir.bootlin.com/linux/v6.10-rc3/source/Documentation/process/maintainer-tip.rst#L128OK, Let rewrite the commit message.
> * Please improve the change description with an imperative wording.
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc3#n94
OK, Let me use imperative word.
> * Would you like to add the tag “Fixes” accordingly?
OK, Let me add Fixes.
> * How do you think about to specify the name of the affected function
>    in the summary phrase?
OK, Let me add the affected function in summary phrase.

> 
> Regards,
> Markus
> 


-- 
Best Regards
Hongchen Zhang

