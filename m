Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78A245012
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782699866; cv=none; b=LXWIR5EFjNrXzhhzCcTHoY1TWW5Odj18OvFOFu1tz60dQR6qsbiFuNxiUulHB46NitQhaacHPpHKWMv1aSQrpsFrqh7rt6rCMKRPWgkc7/Nr7qqUgUS63+b9bGgPe0B0bifOIpAVQVSKEjImIK4eNRQUGisqqwt86tEk7NhMvXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782699866; c=relaxed/simple;
	bh=WR+x1IcDpkV+qYCUhE5T9GrWW5gj5C2ClQbaUX0Ti7M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AtebLE+0mvMtKHsQlWOoFeTDPyrW5GdIC8cNhotqSrYcGFz41/ZPhKqtN+g5/64mtHmiErxPb3c9+2UguJ4H32FZf+BJrD/FjH7kuas8kx7Rjq5DOkC2ddI93ZwSPdNZym/qb3np4YYa4xV1EkOSGp6m4SsRgaGMZOUV99Hy1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxzsBP10Fqvv4YAA--.40582S3;
	Mon, 29 Jun 2026 10:24:15 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxSeBL10FqZBW3AA--.19414S3;
	Mon, 29 Jun 2026 10:24:14 +0800 (CST)
Subject: Re: [PATCH v3 13/16] LoongArch: KVM: Add include defining struct
 cpu_feature
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <dd99dd31bbdb74884b27ea940e76872913b6dc1e.1782682124.git.ukleinek@kernel.org>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <a66f203e-a941-8682-a5ed-a7180f2bb57e@loongson.cn>
Date: Mon, 29 Jun 2026 10:20:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dd99dd31bbdb74884b27ea940e76872913b6dc1e.1782682124.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeBL10FqZBW3AA--.19414S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyUKw4xWw4UCFW5Zw1UurX_yoW8WF48pF
	Wqk3W8Jr4vyr1rZa429a4YvFyrXrWUWF1IvFWYkryUCFnrtF1rX34vkFZ2vrn8G3y8ZF48
	W34fKrnxWFWUtacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=



On 2026/6/29 上午5:58, Uwe Kleine-König (The Capable Hub) wrote:
> Traditionally <linux/mod_devicetable.h> was a header defining a plethora
> of structs, among them struct cpu_features. This was split now with the
> objective that only the relevant bits are included.
> 
> Currently <linux/mod_devicetable.h> is transitively included in
> arch/loongarch/kvm/main.c via:
> 
> 	arch/loongarch/kvm/main.c ->
> 	<linux/kvm_host.h> ->
> 	<linux/entry-virt.h> ->
> 	<linux/resume_user_mode.h> ->
> 	<linux/memcontrol.h> ->
> 	<linux/cgroup.h> ->
> 	<linux/kernel_stat.h> ->
> 	<linux/interrupt.h> ->
> 	<linux/hardirq> ->
> 	<asm/hardirq.h> ->
> 	<linux/irq.h> ->
> 	<asm/irq.h> ->
> 	<linux/irqdomain.h> ->
> 	<linux/of.h> ->
> 	<linux/mod_devicetable.h>
> 
> To keep struct cpu_features available once <linux/of.h> stops including
> <linux/mod_devicetable.h>, include it here explicitly.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>   arch/loongarch/kvm/main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index f105a86143f5..aa0fb4c90d90 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/err.h>
>   #include <linux/module.h>
> +#include <linux/mod_devicetable.h> /* for struct cpu_feature */
>   #include <linux/kvm_host.h>
>   #include <asm/cacheflush.h>
>   #include <asm/cpufeature.h>
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

