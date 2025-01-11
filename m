Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5BE8BEC
	for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736578669; cv=none; b=Pem2wDb81JTfxPDX3AZRNDkFnQ367Po149WVUtbmq0obJBC2llFYkMo2zDD3ntC2/eUUYxKR5iDmhR1u+1fU+eeC14DO5rrNszEX/8B8BZ6TjVK30NeNL9tvnOaK4NLr0oUQO7pYDTuir1qOkGpAW10mAb2TbeGlP9q1n/NUweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736578669; c=relaxed/simple;
	bh=Oa/UwWtg/8TDlxikxK58I88H3cImMq5V2Nihlg5UK1w=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ojhmDJKXTxOGSqUcvAj5nJpDi3rifg5Zi2F/GODQP1+b1s6XlczfkJT5iDF13NCNBqmIBgq+3QylTjlcYrzy0mgfdiJdMspg/7vGVd+USVINopF2CIJW0Gm/UQYk403XVK5qUHvi/ZGgfAAdYvEfP7igJuIKrRCohkzYnyxr/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxbKxpFoJndoFhAA--.6245S3;
	Sat, 11 Jan 2025 14:57:45 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx38dmFoJnWWIdAA--.54495S3;
	Sat, 11 Jan 2025 14:57:43 +0800 (CST)
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
To: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
Date: Sat, 11 Jan 2025 14:57:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241217010905.13054-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBx38dmFoJnWWIdAA--.54495S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw48AF48Zw1ftFy5Kr4xZrc_yoWftwbE9F
	y8WFn5AF45Ww4Yvr42qFn5uFyrKFs8JFW5Kry8Xry2kwn8tr1DGFWakrWDurn5G3s5ZFsF
	kF4vvrn7Cw17uosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
	xvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU
	=

Hi Josh and Peter,

On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
> This version is based on tip/tip.git objtool/core branch [1], add some weak
> and arch-specific functions to make the generic code more readable, tested
> with the latest upstream mainline Binutils, GCC and Clang.

...

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core
>
> Tiezhu Yang (9):
>   objtool: Handle various symbol types of rodata
>   objtool: Handle different entry size of rodata
>   objtool: Handle PC relative relocation type
>   objtool: Handle unreachable entry of rodata
>   objtool/LoongArch: Add support for switch table
>   objtool/LoongArch: Add support for goto table
>   LoongArch: Enable jump table for objtool
>   LoongArch: Convert unreachable() to BUG()
>   drm/amd/display: Mark dc_fixpt_from_fraction() noinline

Are you OK with the first 8 patches?
What's the merge plan for this series?

Thanks,
Tiezhu

