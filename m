Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52DA285066
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776130970; cv=none; b=TLo5deJboqDnuoTUiOuOQCDuCfnqlWFCRYnHAQQeuks9ZiNlj6YZs4PvRg5kx5qpfjvdxxw0UfQpjE48Y3/G2S0GQxuztCeSHWDt1sLubLGrLMq8Zpaxx1ooDdo+PItKlys8KyUBVndAyVIVp8E+liqSqO/8Q1nBkp5d9FAGhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776130970; c=relaxed/simple;
	bh=jtyLwFa+aMGqPO8L2J32ipne6EHTcsYWvXSSkOgcV7E=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WkPGWbi3YAgvQrxz4JwbLga4uK+bXamjRy4+5akkD1txNiHq7HR3PZsSiIo5ZftiFqyhqyiBSFhQUGRUw5xnumwkXVpy7dFXijZOP41mTOpMFifYwTcg9F6J8q2grO3a98DA+7mmmu8ZgUHqJdsF+bScmCJqITiSRZeRe92E2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxhumUm91pmloAAA--.1786S3;
	Tue, 14 Apr 2026 09:42:44 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxXcKRm91p6IxsAA--.7315S3;
	Tue, 14 Apr 2026 09:42:43 +0800 (CST)
Subject: Re: [PATCH] LoongArch/KVM: Fix missing EMULATE_FAIL in ldptr default
 case of kvm_emu_mmio_read
To: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260414013114.306033-1-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <9c1462c5-85ff-4de3-bee4-d394ffdfb63f@loongson.cn>
Date: Tue, 14 Apr 2026 09:39:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260414013114.306033-1-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcKRm91p6IxsAA--.7315S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFyktFW7WFWDKFy5Kw4Dtrc_yoWDuFXEgr
	y7trWUWrWrJ3yUJ3WvgF45Wwn3Kw4UJFs5ZryDCr1rWrykA398WrZYg3Z5ur1DKrZ7GF4F
	vrZYq3Z8CwnF9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUU
	U

On 2026/4/14 上午9:31, cuitao wrote:
> In the ldptr (0x24...0x27) opcode decoding path, the default case
> only breaks out without setting ret to EMULATE_FAIL. This leaves
> run->mmio.len uninitialized (stale from a previous MMIO operation)
> while ret remains EMULATE_DO_MMIO, causing the code to proceed with
> an incorrect MMIO length.
> 
> Add ret = EMULATE_FAIL to match the other default branches in the
> same function (e.g. the 0x28...0x2e and 0x38 cases).
> 
> Signed-off-by: cuitao <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/exit.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> index da0ad89f2eb7..3b95cd0f989b 100644
> --- a/arch/loongarch/kvm/exit.c
> +++ b/arch/loongarch/kvm/exit.c
> @@ -390,6 +390,7 @@ int kvm_emu_mmio_read(struct kvm_vcpu *vcpu, larch_inst inst)
>   			run->mmio.len = 8;
>   			break;
>   		default:
> +			ret = EMULATE_FAIL;
>   			break;
>   		}
>   		break;
> 
Good catch, thanks for doing this.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

