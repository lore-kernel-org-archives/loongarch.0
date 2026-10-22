Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655056;
	b=eMIfGOY2COCBO7Jz5sX1VFfa/INYGKARenl6Mmj4zvonyXUnieno1FNIKkBwnuCLyEJk
	 CRDu6/TBkf3uxJHfKwjcr6LaQ5y+JJoKBOE0Urw/S7nYyqmVS2x8cSjyB/h6nFVvrKVY3
	 aHtdQdci7lxLKhzsCHTVq3zfEZ62KN2ldHieUozERY2AdgyUnEj3ZlwqRgvZLfvnZ46Qz
	 uGtsl2M6YnALRIQiXDrTbtu85xIzR4tvyHgu6lBPC/F0JYmRueG/uOaArSwtPNPOGNYX3
	 OuBOfwBS2XJZh9PGe07n1FtLJUCOGA+Qdr8eR5WU6AmTP2+48pDYU/9e5Iy4jM7DZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655056;
	h=DMARC-Filter:Received:Received:Subject:From:To:Cc:References:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=AoA1P7WKLNrOX02YQSL55viI6QWHAQ+FD5QbIV/xp6s=;
	b=AVZ9Jd1rUTBDTAriBlhkvgnKqyNiE9S1hnfWajZna6DVRPCaKg+vog0UPmGkY7KuMv5R
	 My/FgCTNy2ysEoCj/NMl0yXm3li+NQqusWj//iKVTreV8xmvy03cA2iEuLH0oisR+ZMZF
	 bab9FqiTowpKAZntKayhR35GqxkL3Q3YhP0mcN8D689fefMzrFBoZSLLl2Ldm/xnNnYYq
	 3iStQEE+reGFBAZw09f0mTqSvqYT1fdhUwylkkNE7tPcY8n7jeCIUBBqDUNpO/9Xxzzuo
	 YVjP64OcNC4DvuLby4jRyH2H+yPBfeWDmm9E8BT26suj2BORh2ygad7ZSzFBizyGiFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF39606A31A
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxTNLFvtlqCVIYAA--.5033S3;
	Thu, 22 Oct 2026 15:44:05 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs++vtlqeRsvAA--.32704S2;
	Thu, 22 Oct 2026 15:43:59 +0800 (CST)
Subject: Re: [PATCH v3 0/3] LoongArch: BPF: Refine move_imm() and optimize
 32-bit operations
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016081006.26069-1-yangtiezhu@loongson.cn>
Message-ID: <0b06e77e-540d-19d4-4d9f-de3db1f2c317@loongson.cn>
Date: Thu, 22 Oct 2026 15:43:58 +0800
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
In-Reply-To: <20261016081006.26069-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPs++vtlqeRsvAA--.32704S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4DXFyUuFyUAry7CryDArc_yoW8CF4rpF
	Z8XFs7KF4DXFyjqa4kCr48JFyYka1rtFWDJw4rCryUJrn8Cr18tFWIqF48Aas5CrWF9r9I
	v3yjqrsxZFsxJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU

On 2026/10/16 下午4:10, Tiezhu Yang wrote:
> v3:
>    -- Add a prerequisite patch to detect CPUCFG2_DIV32 feature.
>    -- Fix a hardware compatibility bug by checking cpu_has_div32
>       before emitting native 32-bit div/mod instructions.
> 
> This version is based on v7.3-rc7 and has been tested on Loongson-3A6000
> and Loongson-3A5000 physical machines.
> 
> All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
> and Loongson-3A5000 (without DIV32), here are the test results:
> 
> $ sudo modprobe test_bpf
> $ dmesg -t | grep Summary
> test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> 
> For the BPF selftests test_verifier and test_progs, there are no any
> regressions.
> 
> Tiezhu Yang (3):
>    LoongArch: Add CPUCFG2 DIV32 feature detection
>    LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
>    LoongArch: BPF: Optimize 32-bit operations using native instructions

Hi Huacai, Hengqi,

A gentle ping on the last 2 patches of this series since patch 1
has been applied.

There are no any reports from bot+bpf-ci and sashiko-bot,
and also "test_bpf" and "./test_progs -t jit_insns" tests passed.

Just to clarify the testing status: the 3 failures mentioned in
the previous test report are entirely pre-existing on the clean
bpf-next tree and completely unrelated to this 32-bit optimization
series.

The core ALU32/JMP32 paths introduced here have been fully verified
and passed without any regressions on both 3A6000 and 3A5000 physical
machines.

Do you have any further comments or objections to patches 2 and 3?
If these look good to you, it would be great to have them merged to
avoid rebasing and resending these patches after this merge window.

Thanks,
Tiezhu

