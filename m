Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CFF1FBEB0
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952300; cv=none; b=gjJFfg1V5ZDCnMPo0AxMMt0a715O5CXqKxxuVvmqD+WosvtXDeDeMXS93Xkg6E5pFAPrTxLVj1RSKaBIN6C/VUKfr57iGsBWnvq1MdejmsgFvdVSoRVecVaV2oMJGN+dqTUsf/rzY2U4Jrkm8yyYZ61NkHSp4gLL7Tl+QTh8RAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952300; c=relaxed/simple;
	bh=ft6fMhgbRvb0El/BGYSunQJU3asSMpxYUrHSPdZXrus=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IyUAE6cWirmFiPNyEjvWLC4RHhPceP/8hwQqhSDn72LpIwAigkiRgloHKv3p0BiUP2r1QTIADpzPJGYSxmCgQAQnHvi4dGVYQIRpVFglsrA44gq480QnjBCFNRLXRK2CmBMHvhaPbjBXNjp7MbCAmwLtmAwC98XMsQECq/gHK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3tLl9rhoM3sGAA--.13631S3;
	Thu, 04 Sep 2025 10:18:13 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+Tk9rhoB9h8AA--.1616S3;
	Thu, 04 Sep 2025 10:18:13 +0800 (CST)
Subject: Re: [PATCH v1 2/3] objtool/LoongArch: Fix unreachable instruction
 warnings about EFISTUB
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Huacai Chen
 <chenhuacai@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250901072156.31361-1-yangtiezhu@loongson.cn>
 <20250901072156.31361-3-yangtiezhu@loongson.cn>
 <20250901081904.GB4067720@noisy.programming.kicks-ass.net>
 <82c913b9-4403-cde9-0542-5bd6e04415f5@loongson.cn>
 <wt4qpgi5isj5m6wq33pomvm6borvafuzktekc7lgtoitscar5q@brixzj3lccbw>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ccbb40c1-5f2d-77e9-e8d2-52f2fdbad645@loongson.cn>
Date: Thu, 4 Sep 2025 10:18:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <wt4qpgi5isj5m6wq33pomvm6borvafuzktekc7lgtoitscar5q@brixzj3lccbw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+Tk9rhoB9h8AA--.1616S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF1rWFy5Kr1kGr17XFyfXwc_yoW3trg_ur
	1xZFs2ywn8AF4jy3ZxKr1FvFZ7WFyDWFWUXrZ5Xw1jq34rJayqkrWkAr93Z3s5KFsxZ3Zx
	GF4UWFyrWr12kosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwMKuUUUU
	U

On 2025/9/4 上午3:19, Josh Poimboeuf wrote:
> On Mon, Sep 01, 2025 at 04:39:29PM +0800, Tiezhu Yang wrote:
>> On 2025/9/1 下午4:19, Peter Zijlstra wrote:
>>> On Mon, Sep 01, 2025 at 03:21:55PM +0800, Tiezhu Yang wrote:
>>>> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
>>>> following objtool warnings:

...

>> Josh suggested to do something to put these instructions in the data
>> section, but as said in the previous reply, it needs to modify the link
>> process and seems too complicated and expensive for this warning to some
>> extent.
>>
>> So I did this change for objtool.
> 
> I don't like this workaround either, how exactly is it complicated and
> expensive to put the data in a data section?

I can put them in a data section in the next version, this is
reasonable.

Thanks,
Tiezhu

