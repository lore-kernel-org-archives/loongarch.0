Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5AD36AFF
	for <loongarch@lists.linux.dev>; Wed,  6 Dec 2023 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxJvF2anBl+Es_AA--.61092S3;
	Wed, 06 Dec 2023 20:35:03 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt51anBlDX1WAA--.62107S3;
	Wed, 06 Dec 2023 20:35:01 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension
 instructions
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
References: <20231204141938.7230-1-hengqi.chen@gmail.com>
 <CAAhV-H5-5mCSJ4O3WFSAKM=7ZtjLwQqt3BzVoKuYx94nxkFvTQ@mail.gmail.com>
 <CAEyhmHT28sHhA8edMFuuAi3kWsbsdvDR6Dw8Z02jK4-Fx265tQ@mail.gmail.com>
 <CAAhV-H4ED+fVBEBiOxkM=pN8D3uziv7drNTO3K9vGJpJ=vaF8A@mail.gmail.com>
Cc: loongarch@lists.linux.dev, kernel@xen0n.name
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0ee14c0c-5ed3-7cc3-4e46-4b99389c3d56@loongson.cn>
Date: Wed, 6 Dec 2023 20:35:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4ED+fVBEBiOxkM=pN8D3uziv7drNTO3K9vGJpJ=vaF8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxzt51anBlDX1WAA--.62107S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF45tF4xtw4DKr15uw45urX_yoWrAF1kpa
	sY9Fn7Z3sF934UKFsFkFy8JFWUt3W5Zw48GFyrCryDJan3A3Z8JrWDG3yfAa45KF98Ka15
	KrnIvw47Wa1UtagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=



On 12/05/2023 02:14 PM, Huacai Chen wrote:
> On Tue, Dec 5, 2023 at 1:17 PM Hengqi Chen <hengqi.chen@gmail.com> wrote:
>>
>> On Tue, Dec 5, 2023 at 10:11 AM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>
>>> Hi, Hengqi,
>>>
>>> Why privileged bpf programs have no problem?
>>>
>>
>> I guess you mean the `verifier_movsx` test, but this patch does NOT fix it.
>> This patch is intended to fix `cls_redirect`, `sockopt_inherit` and
>> `verifier_map_ptr_mixing` tests.
> Yes, when you replied to me in another email, I thought you got the
> root cause of verifier_movsx. So that problem still has no fix by now?

I spent some time to analysis and have fixed the failed test case
about verifier_movsx, I will submit a patch after internal review
and more test, maybe at the end of this week or at the beginning
of next week.

Here are the test results with the unsubmitted local patch:

[root@linux bpf]# echo 1 > /proc/sys/net/core/bpf_jit_enable
[root@linux bpf]# echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
[root@linux bpf]# ./test_progs -t verifier_movsx
#361/1   verifier_movsx/MOV32SX, S8:OK
#361/2   verifier_movsx/MOV32SX, S8 @unpriv:OK
#361/3   verifier_movsx/MOV32SX, S16:OK
#361/4   verifier_movsx/MOV32SX, S16 @unpriv:OK
#361/5   verifier_movsx/MOV64SX, S8:OK
#361/6   verifier_movsx/MOV64SX, S8 @unpriv:OK
#361/7   verifier_movsx/MOV64SX, S16:OK
#361/8   verifier_movsx/MOV64SX, S16 @unpriv:OK
#361/9   verifier_movsx/MOV64SX, S32:OK
#361/10  verifier_movsx/MOV64SX, S32 @unpriv:OK
#361/11  verifier_movsx/MOV32SX, S8, range_check:OK
#361/12  verifier_movsx/MOV32SX, S8, range_check @unpriv:OK
#361/13  verifier_movsx/MOV32SX, S16, range_check:OK
#361/14  verifier_movsx/MOV32SX, S16, range_check @unpriv:OK
#361/15  verifier_movsx/MOV32SX, S16, range_check 2:OK
#361/16  verifier_movsx/MOV32SX, S16, range_check 2 @unpriv:OK
#361/17  verifier_movsx/MOV64SX, S8, range_check:OK
#361/18  verifier_movsx/MOV64SX, S8, range_check @unpriv:OK
#361/19  verifier_movsx/MOV64SX, S16, range_check:OK
#361/20  verifier_movsx/MOV64SX, S16, range_check @unpriv:OK
#361/21  verifier_movsx/MOV64SX, S32, range_check:OK
#361/22  verifier_movsx/MOV64SX, S32, range_check @unpriv:OK
#361/23  verifier_movsx/MOV64SX, S16, R10 Sign Extension:OK
#361/24  verifier_movsx/MOV64SX, S16, R10 Sign Extension @unpriv:OK
#361     verifier_movsx:OK
Summary: 1/24 PASSED, 0 SKIPPED, 0 FAILED

[root@linux bpf]# echo 1 > /proc/sys/net/core/bpf_jit_enable
[root@linux bpf]# echo 1 > /proc/sys/kernel/unprivileged_bpf_disabled
[root@linux bpf]# ./test_progs -t verifier_movsx
#361/1   verifier_movsx/MOV32SX, S8:OK
#361/2   verifier_movsx/MOV32SX, S8 @unpriv:SKIP
#361/3   verifier_movsx/MOV32SX, S16:OK
#361/4   verifier_movsx/MOV32SX, S16 @unpriv:SKIP
#361/5   verifier_movsx/MOV64SX, S8:OK
#361/6   verifier_movsx/MOV64SX, S8 @unpriv:SKIP
#361/7   verifier_movsx/MOV64SX, S16:OK
#361/8   verifier_movsx/MOV64SX, S16 @unpriv:SKIP
#361/9   verifier_movsx/MOV64SX, S32:OK
#361/10  verifier_movsx/MOV64SX, S32 @unpriv:SKIP
#361/11  verifier_movsx/MOV32SX, S8, range_check:OK
#361/12  verifier_movsx/MOV32SX, S8, range_check @unpriv:SKIP
#361/13  verifier_movsx/MOV32SX, S16, range_check:OK
#361/14  verifier_movsx/MOV32SX, S16, range_check @unpriv:SKIP
#361/15  verifier_movsx/MOV32SX, S16, range_check 2:OK
#361/16  verifier_movsx/MOV32SX, S16, range_check 2 @unpriv:SKIP
#361/17  verifier_movsx/MOV64SX, S8, range_check:OK
#361/18  verifier_movsx/MOV64SX, S8, range_check @unpriv:SKIP
#361/19  verifier_movsx/MOV64SX, S16, range_check:OK
#361/20  verifier_movsx/MOV64SX, S16, range_check @unpriv:SKIP
#361/21  verifier_movsx/MOV64SX, S32, range_check:OK
#361/22  verifier_movsx/MOV64SX, S32, range_check @unpriv:SKIP
#361/23  verifier_movsx/MOV64SX, S16, R10 Sign Extension:OK
#361/24  verifier_movsx/MOV64SX, S16, R10 Sign Extension @unpriv:SKIP
#361     verifier_movsx:OK (SKIP: 12/24)
Summary: 1/12 PASSED, 12 SKIPPED, 0 FAILED

Thanks,
Tiezhu

