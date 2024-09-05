Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB9E155392
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516700; cv=none; b=G287+xJm+howDTU0xRG9UuujErAMZYQEOlMzM7+Yb2bVCK6PKgmfoQaMJ/BTbV/0EcqNVoHLGsxZxoF6bwN+/LQWBW/tCzq56WqEslMXKAir3chbxv0GDwdfdkSongbEt4ennjS0RmMNFqeRIU+fMhwB129wJQkPHdb4v8+VIpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516700; c=relaxed/simple;
	bh=MmC+kFDuNCsY+xhEUZpUqavH0eth8rtJl33CXjcu710=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OTxMxqo/9rJAt7Nr6Wm4YMCFb06uYNl+PJovjLN890Vs69eiCte3Bd3FbExaw6y1SLFgYKmSJsKsHTn0L6F4OK/d2fLRKzv93mznTMz20jI01658eZnuvQ4Z4JmmWVH4d31pFomTuegBmZlbXTKDYcylqEpj7AoOs7xSLJn5w88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Axz5uWS9lmtxArAA--.56758S3;
	Thu, 05 Sep 2024 14:11:34 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front2 (Coremail) with SMTP id qciowMAxEeaUS9lm95EGAA--.20675S3;
	Thu, 05 Sep 2024 14:11:33 +0800 (CST)
Subject: Re: qemu direct kernel boot on LoongArch
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
From: maobibo <maobibo@loongson.cn>
Message-ID: <95da2e9e-0905-ad61-6bf9-c2636f2cc5f1@loongson.cn>
Date: Thu, 5 Sep 2024 14:11:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMAxEeaUS9lm95EGAA--.20675S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xw1rtr17JrW8CrWUAw17XFc_yoW3uFg_Zr
	srur1DWa95Gay7Aa95tr1kCF9rtanrtrW5trW7Zw10gayDZry5XFn5uF18KFyqyFWUCrnx
	Zas0vFn5ur1UuosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUU
	UUUUU



On 2024/9/5 下午1:25, Thomas Weißschuh wrote:
> On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
>> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
>>>
>>> Jason,
>>>
>>> With the latest qemu 9.1 version, elf format booting is supported.
>>
>> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
>> And the 1G minimum ram limit is gone too.
>>
>> Now working on how to trigger resets.
> 
> With "reset" do you mean normal (non-panic) system shutdown/poweroff?
> Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
> that in a cross-architecture way.
LoongArch uses acpi GED device to reboot machine. Now there is no FDT 
table description and FDT driver for acpi GED device :(

We will investigate pvpanic method.

Regards
Bibo Mao
> 
> 
> Thomas
> 

