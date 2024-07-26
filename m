Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAADD18026
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721958560; cv=none; b=V1/padUz/y2L0ELxX4TM7qseFFHZCZa14t7TAt31xdMlms0Mg+wapj36NNEPVTUBhh/CqqJrUwexv8pO9m/gJ6sGvzQiozRtuW81vjK9kJiPuWL8tM3+D3buTdm0n61M2bDPOT3DjYADl0lUBaUgkdRWUX5UneuoHIZOl9WLMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721958560; c=relaxed/simple;
	bh=Ez3oBfDxD1BPnGpNbRVbv/OwV4g5hNpR9bWKDddkO1M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mc6xgVkxDLbta9YZjOODAWHDKwtgg4V9kEEHv9hpmRDIDzFN30O9e3ZYUmhG19SliCNvMlg3mmClEeuZ15MoPjQTf5uEhpiqAvzEo6Azo3hItyztbHqp6FNuTFY50wnfr2MYlM+JjPxZG6XcEdPrie0yU2Y5E3G9/BY2tnAd0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx+emZAKNmm9sBAA--.6846S3;
	Fri, 26 Jul 2024 09:49:13 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxLseWAKNmzAYCAA--.12104S3;
	Fri, 26 Jul 2024 09:49:13 +0800 (CST)
Subject: Re: [PATCH] KVM: Loongarch: Remove undefined a6 argument comment for
 kvm_hypercall
To: Dandan Zhang <zhangdandan@uniontech.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangyuli@uniontech.com,
 Wentao Guan <guanwentao@uniontech.com>
References: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <c40854ac-38ef-4781-6c6b-4f74e24f265c@loongson.cn>
Date: Fri, 26 Jul 2024 09:49:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxLseWAKNmzAYCAA--.12104S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tryxGFy7AFW5tFWkGF1DCFX_yoW8Gry8pF
	ZxCw1kGF48KrWrC3WUtrZ8ur90gr4kGw12gFWDW3y5CrsrX3saqrWrKr1DuF1DA3yrAFsY
	qa4ag3W5Za1jy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJU
	UUUU=



On 2024/7/25 下午9:48, Dandan Zhang wrote:
> The kvm_hypercall set for LoongArch is limited to a1-a5.
> The mention of a6 in the comment is undefined that needs to be rectified.
> 
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: Dandan Zhang <zhangdandan@uniontech.com>
> ---
>   arch/loongarch/include/asm/kvm_para.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
> index 335fb86778e2..43ec61589e6c 100644
> --- a/arch/loongarch/include/asm/kvm_para.h
> +++ b/arch/loongarch/include/asm/kvm_para.h
> @@ -39,9 +39,9 @@ struct kvm_steal_time {
>    * Hypercall interface for KVM hypervisor
>    *
>    * a0: function identifier
> - * a1-a6: args
> + * a1-a5: args
>    * Return value will be placed in a0.
> - * Up to 6 arguments are passed in a1, a2, a3, a4, a5, a6.
> + * Up to 5 arguments are passed in a1, a2, a3, a4, a5.
>    */
>   static __always_inline long kvm_hypercall0(u64 fid)
>   {
> 

Dandan,

Nice catch. In future hypercall abi may expand such as the number of 
input register and output register, or async hypercall function if there 
is really such requirement.

Anyway the modification is deserved and it is enough to use now, thanks 
for doing it.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

