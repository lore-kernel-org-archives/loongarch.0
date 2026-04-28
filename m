Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663431A9FB7
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382215; cv=none; b=ku03gQfW/HUtVN6V0sWL8tlb8ePzrzkk7t4ZeWMss+7qQrNlSF/vaaT5e93JuKQ1uOM0OMpfZft6zxWJ1zMBev4ZzBHZbOJH6AWWhJ1g81snlTk0XTCCoU4e8FcYvrobnX2Tz5qHtOImCclzKpDvciTqpFKh9cElegcT7QsUnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382215; c=relaxed/simple;
	bh=ENoT9DyOHdVs/2LV4j26lhJrd/KOBk/qMaoICly9DXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLNC5nIDJXkLtocNBh8lFmkOhdUVOflfY5xd7OexxFNNWtvysEXfLrvKXojwY++6RGUisWFTSUmnwYjxaK848Q4TCj0hKvk/pZp0kVt3SqSAFBPD1TB5BKcdHjRwEYYLMELwTk6dup2qEYRWN5wLdt6+ZXAdpwmuoQ1QiR7muB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dHonXBPc; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dHonXBPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777382196;
	bh=QFEMuACF2g86nVHd5EHNDEaguX1EkujIb75gNak0K9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dHonXBPcjSiIzw76fxrzVZZcwUxNA5vddsZJ9vvCI0KYC6L8RIXXdAtgfEIx2zDbl
	 6otr0FY7V1lV2eF6eavBMA0t5tmWfPPSu0zqFfi6UxJwlWfHIX2sdcAqgIgzWU71nA
	 y6mfra1nKWvdY/ri3kwp1LRkmwZfxRzJTLWfzrXM=
X-QQ-mid: zesmtpgz9t1777382190t4f30ebf5
X-QQ-Originating-IP: IsDyi598QwF2Q2wc3qvUcwDwFRvQ6qga+LDUH0M2M/s=
Received: from [10.10.73.115] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 21:16:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1081431552008657951
Message-ID: <56FA25D1E5889E46+22ae8ce8-3fa0-4c4e-86cc-a78c48c29b78@uniontech.com>
Date: Tue, 28 Apr 2026 21:16:28 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Correct the definitions related to
 CSR_CPUID_COREID{_WIDTH}
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260428123510.314073-1-maqianga@uniontech.com>
 <CAAhV-H5O-V73k10h6d_w=QhKHDPJBXOuCkpDESTEechHEsa6Yg@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAAhV-H5O-V73k10h6d_w=QhKHDPJBXOuCkpDESTEechHEsa6Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N2v4nqiyABSwhgoDzaDFD6R1ZSSqu6t4qR5JyDGKtsQpdbQn+lvubOwD
	55LH66zjAtL8AmtD2p28cn/XsXBCxOBNpNnmTw/b0qWNumhe/tcUBEz6uJELkUwSRu3Fify
	Ii9PEz8GhlMWrKE1fPqvGswoWu7D3Rd+zlZXMGcAqR5jXwpB7FZKvYQMSgVvIcRXv9vJ2ce
	cIu+ZqDT343xq1mDsmaDcJZddYRu40MU1WgijjbM6o+FgJpihV0A8zwo6Tu7a9+AESn7GvQ
	Gx3Cb83/cvOuAqIxJ/VBWsicZ1wbYINazbkUX/tXWGYP8Q5cstUw+SOVkBv3Y0lA0YnJiwB
	BqIMj4sTjoEsDyu8vfGtRnGbQTttHk9YHGuic4PU3BXCXvkQTNqewjddt9PmUGv2ClcY1KY
	h1HYI2pqXiXKBZsEowLgvqGsezH8a9zC+q3+OsbvMFqi0kdBLUvh+iMzeVoLA6/i106Hotk
	/wRP1ib+AayqayrIojDnvWx2LcDIi9syR7bNBaiHgWHv1bFZeYSHd0UKtnTHWRuD9XsskV3
	QsN/24qyxULp91p0MF1mnp2X29VD1Dxjdvu/YGvU+F7kRVIieblnTASdxCqjRXkbRUkBuZq
	sTyP0lclRnWf7NWfzcng5skOcZd1kTmmYR50VgtFca1tv2ZwnQO5RkcGijdR/CghNyS7UYk
	0f4zsB4yvPzW2KlyD1DCYOVjI82IRbHArVrtmulU0q4ujWudfPe6DjcFWwQEgU8Y6VK8UQe
	rDW5xIwNddk7k5+3hXS9sa9In32h8BSyVAbkPO9jNJWD2baIJ80HkalUacw7wXTj+MTK/lj
	wabiYyBIe6H84SyXUfn3ZYWEWOmj+r65/t2Er+snHsOuN4WBxghhix+LDl8KsqZcj+5Rb49
	ykBUPgAKotKmzh71NjBaGrnQGcXUqx1Ix2N3QFVua2TaJXr40AI/5qLdeJI+yRaznMXVb1b
	Fuwi2452CaphKmLf+8qAzZ/AEQ3VwZRxDvTUrxtptquqtnVR5/d0wwffR8tjw9KYTTEB+mO
	RxLkjrVcGHTHymO9WsXGvU4v756SjissxGgLAZ9o3c4GIY+10apBDuqAvqd55/TRx8UamhP
	5X+gapxv56V
X-QQ-XMRINFO: NyFYKkN4Ny6FMjhX8OLDKU4XXWR2a5/4Uw==
X-QQ-RECHKSPAM: 0


在 2026/4/28 20:47, Huacai Chen 写道:
> Can you do some investigation about the history before coding?
> 9559d5806319a9254d9053b22a31324e1929aac ("LoongArch: Increase max
> supported CPUs up to 2048")

Uh, uh, uh, my fault. I'll be more careful next time. Besides the 
document, there's also the code history submission.

>
> Huacai
>
> On Tue, Apr 28, 2026 at 8:36 PM Qiang Ma <maqianga@uniontech.com> wrote:
>> The valid bits of CPU Identity (CPUID) are 0 to 8
>> according to LoongArch Reference Manual, so change
>> 11 to 9 for the related code.
>>
>> Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#cpu-identity
>>
>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>> ---
>>   arch/loongarch/include/asm/loongarch.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
>> index 2a6bc99177d8..bc47df90fee6 100644
>> --- a/arch/loongarch/include/asm/loongarch.h
>> +++ b/arch/loongarch/include/asm/loongarch.h
>> @@ -429,8 +429,8 @@
>>
>>   /* Config CSR registers */
>>   #define LOONGARCH_CSR_CPUID            0x20    /* CPU core id */
>> -#define  CSR_CPUID_COREID_WIDTH                11
>> -#define  CSR_CPUID_COREID              _ULCAST_(0x7ff)
>> +#define  CSR_CPUID_COREID_WIDTH                9
>> +#define  CSR_CPUID_COREID              _ULCAST_(0x1ff)
>>
>>   #define LOONGARCH_CSR_PRCFG1           0x21    /* Config1 */
>>   #define  CSR_CONF1_VSMAX_SHIFT         12
>> --
>> 2.20.1
>>

