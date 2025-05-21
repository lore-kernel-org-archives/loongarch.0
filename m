Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E2E2367AC
	for <loongarch@lists.linux.dev>; Wed, 21 May 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820252; cv=none; b=o40+hdtnlBaebNgzFsZOlFYFfuNo0UEy/ZrDbpjtAvyrQOoN96adq5uANAV/+eKF+h3fdb2cKbTKCXbzNsghXn2oWrl9G543B9nwIEIVRx82rZ6VqjoLtK5vGIiBkRo0wmpbhigbkWhZ/MPmTsSUDShq5rNR8IsUUyxDGG2eKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820252; c=relaxed/simple;
	bh=N8yWSW5tYLd4q2UM0vWpfUGoZ8tTE6cCS0D8RWw2pbY=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SKagGdrTuE6Y2uaxUq3CZZusz8JiVepdiqQlB/1V7Z4k9U4eZck5svPAI/ADcOh74luWnM2XwW47tNXBL7o8QG1mo4SaQJ0npkvhrTTBPcl249X6ahNfGexHCgDXZJ/0YuQFxU6zJOVgUkDkMgPD1J5Ki4oKatHbFt7Sba5hC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxmnHVni1oMJv0AA--.2266S3;
	Wed, 21 May 2025 17:37:25 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxzxvRni1o0QnlAA--.10296S3;
	Wed, 21 May 2025 17:37:21 +0800 (CST)
Subject: Re: [PATCH] dcache: Define DNAME_INLINE_LEN as a number directly
To: Yonghong Song <yonghong.song@linux.dev>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>
References: <20250520064707.31135-1-yangtiezhu@loongson.cn>
 <20250520082258.GC2023217@ZenIV>
 <CAADnVQJW+qyq9wPD6RdoaZ8nLYX8N2+4Bhxyd19h6pdqNRMc3A@mail.gmail.com>
 <b932c4b8-a45d-4da3-8ef9-f45055830609@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <9750057e-2efa-58e1-8739-290f1b2a9104@loongson.cn>
Date: Wed, 21 May 2025 17:37:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b932c4b8-a45d-4da3-8ef9-f45055830609@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxzxvRni1o0QnlAA--.10296S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy7ZF1xKFWDWw1rXw17XFc_yoW8Zr48pa
	45KanFkr4DKFWrAr9F9wsYvFyftws3tayYgas5Xr10y3s0vF1fGF4Ig3y5uF93Cw48Cw4j
	9w1jqFy3Zr18AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24SoDUUU
	U

On 05/21/2025 02:26 AM, Yonghong Song wrote:
>
>
> On 5/20/25 1:04 AM, Alexei Starovoitov wrote:
>> On Tue, May 20, 2025 at 1:23 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>> On Tue, May 20, 2025 at 02:47:07PM +0800, Tiezhu Yang wrote:
>>>> When executing the bcc script, there exists the following error
>>>> on LoongArch and x86_64:
>>> NOTABUG.  You can't require array sizes to contain no arithmetics,
>>> including sizeof().  Well, you can, but don't expect your requests
>>> to be satisfied.
>>>
>>>> How to reproduce:
>>>>
>>>> git clone https://github.com/iovisor/bcc.git
>>>> mkdir bcc/build; cd bcc/build
>>>> cmake ..
>>>> make
>>>> sudo make install
>>>> sudo /usr/share/bcc/tools/filetop
>>> So fix the script.  Or report it to whoever wrote it, if it's
>>> not yours.
>> +1
>>
>>> I'm sorry, but we are NOT going to accomodate random parsers
>>> poking inside the kernel-internal headers and failing to
>>> actually parse the language they are written in.
>>>
>>> If you want to exfiltrate a constant, do what e.g. asm-offsets is
>>> doing.  Take a look at e.g.  arch/loongarch/kernel/asm-offsets.c
>>> and check what ends up in include/generated/asm-offsets.h - the
>>> latter is entirely produced out of the former.
>>>
>>> The trick is to have inline asm that would spew a recognizable
>>> line when compiled into assembler, with the value(s) you want
>>> substituted into it.  See include/linux/kbuild.h for the macros.
>>>
>>> Then you pick these lines out of generated your_file.s - no need
>>> to use python, sed(1) will do just fine.  See filechk_offsets in
>>> scripts/Makefile.lib for that part.
>> None of it is necessary.
>>
>> Tiezhu,
>>
>> bcc's tools/filetop.py is really old and obsolete.
>> It's not worth fixing. I'd delete it.
>> Use bcc's libbpf-tools/filetop instead.
>
> Tiezhu, please check whether libbpf-tools/filetop satisfied your need or
> not. Thanks!

Yes, it works well for me.

