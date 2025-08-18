Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF2A7494
	for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 03:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755488928; cv=none; b=L4mRywzRxefYeb6kzByoVMD7bCbrbwy2sauQXbxbMliubTQxj2QmSySEoSK7AeVqZvbKwdCEXXx26P0B1LeZ4u5g/gJmuw5vd9JVcnlYI0yD8FF7oNnqKoDtQCI+Y3wk0D62LDCZTskFARi8Gp67aYVoDO16Plm4EOFTlywFlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755488928; c=relaxed/simple;
	bh=9rNN2l2BSzLlAGChb7BkAAx9jQ0N67cHtfdPEx9MIsU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=soZzOF/X0GLDgH4Btbzc8aWdjGanprUUR1Oa9EMvkhu4SuGNJAhZk+0SQ5+nhdz+IB+IBR9/Ikn4Sc/logm9D0eHOYQgS80FYdvxgqYLHFhNLgPv0k2XdP3KgGqlDPLmcvSD/JRrLW6j8xemLZNksznTxispGk1NGenDXBXXo+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxPOKZoqJoSjRBAQ--.17212S3;
	Mon, 18 Aug 2025 11:48:41 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxvsGYoqJoEbZUAA--.20054S3;
	Mon, 18 Aug 2025 11:48:41 +0800 (CST)
Subject: Re: [PATCH 0/2] Fix objtool warnings if LTO is enabled for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250812132716.1465-1-yangtiezhu@loongson.cn>
 <20250814230137.GA2247447@ax162>
 <CAAhV-H4pYKb9+XUZW4QNWiMQSZVBBsVSvDNB5RvKWnxFEC-gcg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <80f3c9ff-5949-b8d3-6067-18090e7a282a@loongson.cn>
Date: Mon, 18 Aug 2025 11:48:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4pYKb9+XUZW4QNWiMQSZVBBsVSvDNB5RvKWnxFEC-gcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxvsGYoqJoEbZUAA--.20054S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw15GryrZw18KFWxZr17XFc_yoWDKFX_Zr
	1Duwn3Cw17CanFya9xKas3ur1DKan7Was5Xw1SqryUGwnxJa1DCrWUGwnavrnagF48JFsr
	GrZ09rsI9347WosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU

On 2025/8/16 下午10:59, Huacai Chen wrote:
> On Fri, Aug 15, 2025 at 7:01 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Tue, Aug 12, 2025 at 09:27:14PM +0800, Tiezhu Yang wrote:
>>> The patch #1 should be a preparation for patch #2, that is to say,
>>> the patch #2 is dependent on the patch #1, otherwise there is build
>>> error if LTO is enabled after only applying patch #2.
>>
>> Thanks, these two patches do indeed resolve most of the warnings that I
>> see.
>>
>> Tested-by: Nathan Chancellor <nathan@kernel.org>
>>
>>> With this series, most of warnings have been silenced, only remains
>>> the following warning by now, it needs more analysis:
>>>
>>>    vmlinux.o: warning: objtool: __efistub_efi_boot_kernel() falls through
>>>    to next function __efistub_exit_boot_func()
>>
>> Yes, I do see this one too. Odd, as efi_boot_kernel() ends in a
>> __noreturn function...
> But this one only exists for LTO?

Yes, this is true.

I have fixed this warning and the other new warnings locally,
will do more testing before sending patches.

Thanks,
Tiezhu

