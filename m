Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845495;
	b=b1dLb2aelP/ssVD/03dIEPN5XUZZEZo+7jfm23ayY7WIS5MPBi8Cd0Saqqux9uxcXxaK
	 a+roB5dYjAnsmlgobxc+4sJ5bKh1oZqC6Xaq8BbZpPdzwncgHHkSn81LyMrKdxitXDw2b
	 y2Ts9O46CLaHOoC3G75svqCTfgpV47L8jJzLw1Oit+7Pc4Mx5wpw0s5AHYH/zgKpJlLW0
	 k4bwoqoJKHjug/KMH/pCbXFF/ajzEI26Dx1ZPaHZ0eSogsDpxspxH0eHowZWPFegsoU0f
	 zOPEjcn9Er0raaw7aSxVVDfVTlhpMKrThPxvm1TJbW2/OCSvra7M7keQJOrsfmBlgqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845495;
	h=DMARC-Filter:Received:Received:Subject:From:To:Cc:References:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Sbhm20W68mSgDIFaGhBAslfNjBCrE2BwjldhEdE4E30=;
	b=3Nrcep045cbfMo/RUJY4gg/awOYqQPxikQ6cVLAB0A3R1PwSZfpsxRxO8JGvPEIo5fXh
	 NuDDnYRtIsesdVqR0yHn5HGsbdhAzQWFPrTPD8XhO/VxCpVi2jjWC+80itgXEzEvrwA9R
	 KMP3sq9odi/vv65kSxFBV1ZHp6nTRqYzRpSZH5IskkNrxzlujY8RKZ7f6os+FtdHmcjmj
	 pC5hv9+GO60jXoyw3pWI9h1bmnn+/l/jxFWTHQY5J8j8097yyoodhUU8yc9kxIFwjrJ2a
	 VaDxQKn0IVUekkr1EL9JkMW3NfYEhIqf6kg6Lp2N+nWwjGnLQLKvO5wd74/wbZlQr7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37958606A32E
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 02:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37958606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bx69Hw6Otq0IAcAA--.16798S3;
	Thu, 05 Nov 2026 10:24:48 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxf8_u6OtqrHkyAA--.40113S2;
	Thu, 05 Nov 2026 10:24:47 +0800 (CST)
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Make arena support depend on SCQ
 extension
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102072808.23080-1-yangtiezhu@loongson.cn>
 <20261102072808.23080-2-yangtiezhu@loongson.cn>
 <CAAhV-H52mbZJX2vkgG_h=XfwHoio=asLjFdhTJwUYqDp4V5JMg@mail.gmail.com>
 <8b00e5a7-4e60-19bd-7953-f76dc71e15ec@loongson.cn>
 <CAAhV-H52bqRD1SyrZsvMkNbCpGiM5DPSGPARiasZ8G3XsE5Tgw@mail.gmail.com>
 <6446c385-623c-d4cf-5a07-0c2276c6f50c@loongson.cn>
 <CAAhV-H4m-cokYz19HHAoDeLAjRGp4T=vwDOJaJEcHXZDW15rkQ@mail.gmail.com>
 <64b8f867-029d-3cdb-7896-1229a076e25c@loongson.cn>
Message-ID: <e43e0960-be3b-126e-1a79-35e56d821319@loongson.cn>
Date: Thu, 5 Nov 2026 10:24:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <64b8f867-029d-3cdb-7896-1229a076e25c@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCxf8_u6OtqrHkyAA--.40113S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF48Wry7uF1ftFy8tFyDCFX_yoWkWFc_Wr
	s5Kr1qyw1kXFy3Ga1vqr1FvFsrKw4vga48tryvgr13Z340qry5GayxtryfXrn3Kw4vvFn8
	Ca98Z39xZw1q9osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUzsqWUUUUU

On 11/4/26 9:06 PM, Tiezhu Yang wrote:
> On 11/4/26 5:54 PM, Huacai Chen wrote:

...

> Personally, I feel Approach 1 represents the pure semantic intent
> better, whereas Approach 2 looks more aesthetically pleasing.
> 
> Which one do you prefer for the v2 patch?

FYI, here is another relevant discussion from the RISC-V ZACAS patch
where the same code aesthetic vs. semantic precision trade-off was
evaluated:
https://lore.kernel.org/bpf/3e7fb313-021a-49d0-9def-fd9f03e3c2bb@huawei.com/

 > "Originally, I thought
 > rv_ext_enabled(ZACAS) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS)
 > would make it more explicit, but system_has_cmpxchg128() seems
 > to better capture what we were missing."

Using the generic system_has_cmpxchg128() directly mirrors the
precise condition defined in the MM core layer (mm/slab.h). It
prevents the JIT layer from over-relying on arch-specific
Kconfig/hardware knobs to mock generic allocator properties.

Therefore, I think using the generic #ifdef form is more robust
and keeps cross-architecture BPF JIT implementations symmetric.

Thanks,
Tiezhu

