Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6032309B9
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767162927; cv=none; b=iCxSgzoqan1aKwtxiWPNnvv0aENbfkSwGEmhaI4tvvqjNXOxegD7fEWeSW0oFZEpBKy+vpyRvjidxTwzOeT5OlQ/9GUHghLzhb10Uv2Dor12z/xzk7E31uYOhttUcfTw9rH3HoskyJg+WuN9ywYmfIyzKJUugYn+94u31weQVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767162927; c=relaxed/simple;
	bh=bxw4Aj30meQU68rcCriF9pGZTUcJEVG7IgcnyMcUF98=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JJmjStCFn0CwvVuRFOF7VbTpu3q02Ee/LsR8cfhKvvVWq4wCIlvlZDlA/6a93hq3bkGWUO6cRH6XNsm961hhs/ZBwstnG+o9oF47g1GMdwAC9lhxxgE5EZ7194D7EStGhlxyS7URaHsuerv2sqqEOVlmdt7rer4qVzQ4RzR7kVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxDMMnxFRp0ZkEAA--.14495S3;
	Wed, 31 Dec 2025 14:35:20 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAx28EkxFRp3qYHAA--.16941S3;
	Wed, 31 Dec 2025 14:35:18 +0800 (CST)
Subject: Re: [PATCH 0/3] LoongArch: KVM: Fix kvm_device leak in
 kvm_{pch_pic|ipi|eiointc}_destroy
To: Qiang Ma <maqianga@uniontech.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251226150706.2511127-1-maqianga@uniontech.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <99826cf9-356d-235b-9c7c-9d51d36e53c3@loongson.cn>
Date: Wed, 31 Dec 2025 14:32:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251226150706.2511127-1-maqianga@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28EkxFRp3qYHAA--.16941S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr4rXFy3KFy5Gr48AryxJFc_yoW3trb_XF
	1Iyrn7ZrWkW3W8Gr1Yvr1rJwnIkF4FqFZ5tr93Zry8W34YqrWDZrW5W3s2vF1Igw4UZrZ8
	AFZ2yr9Yyr1jkosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82ZX5UUUU
	U==

Hi qiang,

Thanks for the patch, it looks good to me.

For the whole series.
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

Regards
Bibo Mao

On 2025/12/26 下午11:07, Qiang Ma wrote:
> In kvm_ioctl_create_device(), kvm_device has allocated memory,
> kvm_device->destroy() seems to be supposed to free its kvm_device
> struct, but kvm_pch_pic_destroy() is not currently doing this,
> that would lead to a memory leak.
> 
> So, fix it.
> 
> Qiang Ma (3):
>    LoongArch: KVM: Fix kvm_device leak in kvm_pch_pic_destroy
>    LoongArch: KVM: Fix kvm_device leak in kvm_ipi_destroy
>    LoongArch: KVM: Fix kvm_device leak in kvm_eiointc_destroy
> 
>   arch/loongarch/kvm/intc/eiointc.c | 2 ++
>   arch/loongarch/kvm/intc/ipi.c     | 2 ++
>   arch/loongarch/kvm/intc/pch_pic.c | 2 ++
>   3 files changed, 6 insertions(+)
> 

