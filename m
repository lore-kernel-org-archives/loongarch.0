Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419C529D27D
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212462; cv=none; b=t96VQXEBIg4z6eujo2yluIpkFd1WwRHCG0GKFQz21OeSTcHrSDdVKsZRadgkPw/bhnyRJsQ4WTpWsLqKW6DDuHJUSYmOWH1RttOrZq2bWAtMbxehFBzPiL1Nh8MtO4Y1BnG2Ytc4C72KpZAbaL7d5yokz828Rnpcw4Bl9W9Ilrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212462; c=relaxed/simple;
	bh=sknLkJrY2FW9h2/2szgqhfmaSlNFmQxYL1LleLbL6yY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=os+7+xZT2ezQ9v9gn+fMgTW7Behl08BNCtrs7HFpMAmuTe4vPhhxYMp8r1PNJ+0Di9HRokgI7z0Yp2Miz9PODBpTBh/JRVbq0fuMMNyRavvSGxkoQa7EKjD8L46INX4aRl+gQHFmF3XPyjY3UTGJBd1OYCU1a+bSX5o/T6Mt3ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxM9Dovidp95YoAA--.22287S3;
	Thu, 27 Nov 2025 11:00:56 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxE+TdvidpJ51AAQ--.46928S3;
	Thu, 27 Nov 2025 11:00:47 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Jinyang He <hejinyang@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
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
 <226cffcb-2302-8afb-8be6-9cab2176d15b@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4f60b8a9-8c6f-2893-3ab0-43501f00b95b@loongson.cn>
Date: Thu, 27 Nov 2025 10:58:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <226cffcb-2302-8afb-8be6-9cab2176d15b@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+TdvidpJ51AAQ--.46928S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKFWftryfAry3Gw43Ary7urX_yoW3XFg_Za
	4DCFW7Wr1kCwsIgwsxtFs3JrW7Jay8KrWkKw1kuryvy3s8JFyvkrsI9r12yw1xtFW5Arnr
	A343ua4vk3sakosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07josjUUUUUU=



On 2025/11/27 上午10:53, Jinyang He wrote:
> On 2025-11-27 09:53, Bibo Mao wrote:
> 
>>
>> Just be curious, it is the same orc unwind method. why is clean with 
>> file arch/x86/kernel/unwind_orc.c, however there is special handling 
>> bt_address() in file arch/loongarch/kernel/unwind_orc.c ?
>>
> I'm not familiar with x86. Does it also copies exception handler to
> other address like LoongArch? When backtrace to the copied exception
> handler, its ORC info is not collected. The bt_address finds a
> shadow PC to get the right ORC info and go on.
I am not familiar with x86 and ORC also. So can ORC unwind handle copied 
text also? If not, why not disable text copy or provide general API to 
handle this.

Regards
Bibo Mao
> 
> Thanks,
> Jinyang
> 

