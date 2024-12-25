Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BC61E535;
	Wed, 25 Dec 2024 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735119845; cv=none; b=hgzIfBh2b9zBqTC7xxy5yfrAlF48Wx5cXc/emwNLeG4bIBMNOnQX91dIlC+vypwWbPUdavhlOA9VRj5Q0rx6k4YsRreFs5n2xy/muSG2cmh4HmsBd+wBcWqshLkae2FJTZvGJ59AxsiBGLTlVjWojslb4BfmgMUomw/0dEYVa4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735119845; c=relaxed/simple;
	bh=qG+sEKhe/dJMugL0RB6ZF8lRnVvXLNlIDxlhmr/VPMg=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mpyrSySs6LB6+Fr8i5z9OuwPlSv12ohxB6+WK1I+BxH5DM5S2xMaVZBf5pY+yHVoE1lefPF/qgOMyHnweHOc/gPz3nVR21XbwIFJ3is/8QxOL2kF9gds3AoGyfUeolZ44Ew12tkL+KZE7/DNT7ufVLoL/BE/1QldEz4D73f48Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_67c02tnTVFaAA--.7776S3;
	Wed, 25 Dec 2024 17:43:56 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxzsXa02tn5bcIAA--.37718S3;
	Wed, 25 Dec 2024 17:43:54 +0800 (CST)
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
To: Nathan Chancellor <nathan@kernel.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
 <20241220103100.GB17537@noisy.programming.kicks-ass.net>
 <20241220223403.GA2605890@ax162>
 <05cdb3b4c9bddf25f7b839229b635d2dec5140a4.camel@xry111.site>
 <bc35fddc-498a-cc58-b6a1-f5234a4f6d0d@loongson.cn>
 <20241223214645.GB1188382@ax162>
Cc: Xi Ruoyao <xry111@xry111.site>, Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexdeucher@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <73c297f1-05a7-e786-557c-b267b125b6d5@loongson.cn>
Date: Wed, 25 Dec 2024 17:43:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241223214645.GB1188382@ax162>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxzsXa02tn5bcIAA--.37718S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww4UJF4DZw1fZFy5ZF47Awc_yoW5JF45pa
	yfKF98Zr1DAF4xtasrGw18WFW3Aa4fGF40gF15C395u347AFn8urWfJF1kGrW3Gry7AF4a
	qF4DKrWUJF1qyFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOa93UUU
	UU=

On 12/24/2024 05:46 AM, Nathan Chancellor wrote:
> On Sun, Dec 22, 2024 at 12:27:47PM +0800, Tiezhu Yang wrote:

...

>> With the above changes, there is no "falls through" objtool warning
>> compiled with both clang 19 and the latest mainline clang 20.
>
> I am somewhat surprised that changes anything because the ASSERT is not
> stopping control flow so I would expect the same problem as before. I
> guess it does not happen perhaps due to inlining differences? I looked

It is weird and I think it is not the correct way.

> at this code briefly when I sent my initial message and I was not sure
> where such a check should exist. It does not look like these functions
> really do any sort of error handling.
>
>> If you are OK with it, I will send a separate formal patch to handle
>> this issue after doing some more testing.
>
> It may still be worth doing this to get some initial thoughts from the
> AMD DRM folks.

I think the correct way is:

Keep the current ASSERT for the aim of debugging, just add BUG() to
stop control flow if the divisor is zero.

--- >8 ---

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c 
b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..e15391e36b40 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -52,6 +52,7 @@ static inline unsigned long long 
complete_integer_division_u64(
         unsigned long long result;

         ASSERT(divisor);
+       BUG_ON(!divisor);

         result = div64_u64_rem(dividend, divisor, remainder);

diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c 
b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 131f1e3949d3..ce2036950808 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -30,6 +30,7 @@ static inline unsigned long long 
spl_complete_integer_division_u64(
         unsigned long long result;

         SPL_ASSERT(divisor);
+       BUG_ON(!divisor);

         result = spl_div64_u64_rem(dividend, divisor, remainder);

It looks reasonable and works well both on x86 and LoongArch, there are
no the following objtool warnings:

   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
   spl_fixpt_recip() falls through to next function spl_fixpt_sinc()

If no more comments, I will send a separate formal patch for your
review in the next week.

Thanks,
Tiezhu

