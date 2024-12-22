Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB467DA8C;
	Sun, 22 Dec 2024 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841771; cv=none; b=Go2MXCCupKr7LBFeJysG4nxWkCcaNcpR77zVQTKmB+lzC0RJM5dAOPs33pVlazmmXh/WJlJc2JsytWJW+lEseyjWmy2za5Jg1F/wRJtoRRwMWvuRPfiAHFbCZjbmY3fIb4xoIiKxGvh/bxZqfzQw5b4rpYnwT5AnQcG4f6FgPvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841771; c=relaxed/simple;
	bh=ofCf1akM1Rj4Et01SCsrVmJ0xx3ask4YGXdXZdKtMI8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EPu/qnW4W1SPL9S+/89HfO3Cz5ij9BM8PS+/zVaCWh45xE9YHPhH5payhbObNg2fGtcgAKUwTA0ZuaKshalmRV+E6ja4lp9C5m3FTa3wp3ixmLhrQl/9/3UBxj3Ijt0ibk6HB0NFULk7AoAiJwQrd6E31ADYKPr+eah3s0qW5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxyuBGlWdnlF5ZAA--.43504S3;
	Sun, 22 Dec 2024 12:27:50 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxReRDlWdnEC0FAA--.29113S3;
	Sun, 22 Dec 2024 12:27:47 +0800 (CST)
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
To: Xi Ruoyao <xry111@xry111.site>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
 <20241220103100.GB17537@noisy.programming.kicks-ass.net>
 <20241220223403.GA2605890@ax162>
 <05cdb3b4c9bddf25f7b839229b635d2dec5140a4.camel@xry111.site>
Cc: Alex Deucher <alexdeucher@gmail.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bc35fddc-498a-cc58-b6a1-f5234a4f6d0d@loongson.cn>
Date: Sun, 22 Dec 2024 12:27:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <05cdb3b4c9bddf25f7b839229b635d2dec5140a4.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxReRDlWdnEC0FAA--.29113S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFWfJryDGr13JF18Wr1kXrc_yoW5Jr1kpF
	4rJFyUGrWDXFySvFZFkw15Xa93A3yfJr4kGFyrur1rAa47AanY9rs3t3WkJayakr42yr40
	va98KFyqyF4qyFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOa93UUUUU=

On 12/21/2024 03:40 PM, Xi Ruoyao wrote:
> On Fri, 2024-12-20 at 15:34 -0700, Nathan Chancellor wrote:
>>> Now, the thing is, these ASSERT()s are checking for divide-by-zero, I
>>> suspect clang figured that out and invokes UB on us and just stops
>>> code-gen.
>>
>> Yeah, I think your analysis is spot on, as this was introduced by a
>> change in clang from a few months ago according to my bisect:
>>
>> https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448
>>
>> Since the ASSERT does not do anything to prevent the divide by zero (it
>> just flags it with WARN_ON) and the rest of the code doesn't either, I
>> assume that the codegen stops as soon as it encounters the unreachable
>> that change created from the path where divide by zero would occur via
>>
>>   dc_fixpt_recip() ->
>>     dc_fixpt_from_fraction() ->
>>       complete_integer_division_u64() ->
>>         div64_u64_rem()
>>
>> Shouldn't callers of division functions harden them against dividing by
>> zero?
>
> Yes I think it'd be the correct solution.

Thank you all. Do you mean like this?

--- >8 ---

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c 
b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..848d8e67304a 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -79,11 +79,13 @@ struct fixed31_32 dc_fixpt_from_fraction(long long 
numerator, long long denomina
         unsigned long long arg2_value = arg2_negative ? -denominator : 
denominator;

         unsigned long long remainder;
+       unsigned long long res_value;

         /* determine integer part */

-       unsigned long long res_value = complete_integer_division_u64(
-               arg1_value, arg2_value, &remainder);
+       ASSERT(arg2_value);
+
+       res_value = complete_integer_division_u64(arg1_value, 
arg2_value, &remainder);

         ASSERT(res_value <= LONG_MAX);

@@ -214,8 +216,6 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 arg)
          * Good idea to use Newton's method
          */

-       ASSERT(arg.value);
-
         return dc_fixpt_from_fraction(
                 dc_fixpt_one.value,
                 arg.value);

With the above changes, there is no "falls through" objtool warning
compiled with both clang 19 and the latest mainline clang 20.

If you are OK with it, I will send a separate formal patch to handle
this issue after doing some more testing.

Thanks,
Tiezhu

