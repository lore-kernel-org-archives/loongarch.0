Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FCA299A81
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212008; cv=none; b=Xc3R0jvddD7gAN9ISLA/vkjHE/kWyhQTj0sYdC1++zMwW5AilsnEQPrdVmghOR53Ke6AUm+0V+O6n/ahe05mJ+diSKGMLqWxRTSactcj8AE7zbIOw9PzlGdM2aUuOh1yeVF69dsew9Pob+AGDTiaSDS1WykD3oKpPCcWhaVz3XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212008; c=relaxed/simple;
	bh=BHKUu2/FF8uRuGMPhZ8wlaVWl/4U/bUGNlKoXGKKpXU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=InczcH69YbUlsZFXgDrzNp2VipFdn181WYrpuB2t5vjFoAMS6kp3Gp1IDs0MVoVkmEBRIZoA5WsXW5IMy5CU6dxQ+KrKnNAvSUKfWD9/vkG+yclZ9Ra7oaV2XjOaAaezG528lLqfc6VZZUp6BjterYdiPRkx/300yMwE7oE2Uec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Bx378ivSdpM5YoAA--.19674S3;
	Thu, 27 Nov 2025 10:53:23 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowJAxfcEfvSdpjZtAAQ--.53223S3;
	Thu, 27 Nov 2025 10:53:21 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Bibo Mao <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
 <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
 <f5dab282-ed95-2161-2367-4a1f7b70e5a8@loongson.cn>
 <87730f18-4ad7-2a21-f1bd-483074748b37@loongson.cn>
 <7ddd6efc-e7ad-b2f8-9a4d-5ca1cad9e74d@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <226cffcb-2302-8afb-8be6-9cab2176d15b@loongson.cn>
Date: Thu, 27 Nov 2025 10:53:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7ddd6efc-e7ad-b2f8-9a4d-5ca1cad9e74d@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxfcEfvSdpjZtAAQ--.53223S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4c8EcI0En4kS14v26r1Y6r17MxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU

On 2025-11-27 09:53, Bibo Mao wrote:

>
> Just be curious, it is the same orc unwind method. why is clean with 
> file arch/x86/kernel/unwind_orc.c, however there is special handling 
> bt_address() in file arch/loongarch/kernel/unwind_orc.c ?
>
I'm not familiar with x86. Does it also copies exception handler to
other address like LoongArch? When backtrace to the copied exception
handler, its ORC info is not collected. The bt_address finds a
shadow PC to get the right ORC info and go on.

Thanks,
Jinyang

