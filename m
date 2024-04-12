Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723FF54919
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712912296; cv=none; b=iCBLkfK+xIO0wLtUaC+M5Ha4ZvkrO5xj+Rzm+dQftaImBbVAbQoYQz7qqVr033Wm5Uqz64mMEYGB6mcQUCACsguCj0h7M354eP7ZcwwO20dobIjanP5zzwtcBoP/qCLIFHCcNidtyO8X+Qqb7teuqZktlKd6eNM8CLq6pDQewZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712912296; c=relaxed/simple;
	bh=wvTxpBz/xlX0wCAj5ZppzKJswZIdN3eORJa84MXXZYU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LcEIBWROR7Q3E2cVH8/1MV7rXNprG4BW633gIp2pwP8VkjcaGgkTeWCVTyabS9zOvC+5cPK5dWEex7ygBiDdvG0LKyoEN/j4qZ7ER2Ykrt55z4+JY0zkmq4eSlQV7xv1643zyzsdJNzVN2U4YAkCI4DWF7qbLvZsHFjCldTqfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8Cxqrqh9xhmNk8mAA--.6520S3;
	Fri, 12 Apr 2024 16:58:10 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDBOe9xhmwZx4AA--.34934S3;
	Fri, 12 Apr 2024 16:58:08 +0800 (CST)
Subject: Re: [PATCH] KVM: loongarch: Add vcpu id check before create vcpu
To: Wujie Duan <wjduan@linx-info.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240412084703.1407412-1-wjduan@linx-info.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <2b6e60ad-1138-06cf-015a-40d7e6ca7a10@loongson.cn>
Date: Fri, 12 Apr 2024 16:58:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240412084703.1407412-1-wjduan@linx-info.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDBOe9xhmwZx4AA--.34934S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw1rKF43XF4DAr4fCry7XFc_yoW3CFb_Gr
	1Ikw15KrW8J3Wvq3yqgr1fJryrJw4kJFZ0v3WUZr47J3ZrJr97urWvg3W7Cw4DKrW8Aa15
	Aa90yr9xC34ayosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOeOJUUU
	UU=



On 2024/4/12 下午4:47, Wujie Duan wrote:
> Add a pre-allocation arch condition to checks that vcpu id should
> smaller than max_vcpus
> 
> Signed-off-by: Wujie Duan <wjduan@linx-info.com>
> ---
>   arch/loongarch/kvm/vcpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 3a8779065f73..d41cacf39583 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -884,6 +884,9 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
>   
>   int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>   {
> +	if (id >= kvm->max_vcpus)
> +		return -EINVAL;
> +
>   	return 0;
>   }
>   
> 
Good catch, and thanks for your contribution.

Reviewed-by: bibo mao <maobibo@loongson.cn>

