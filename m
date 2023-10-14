Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9127E
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxuOgC+SllGOkxAA--.60398S3;
	Sat, 14 Oct 2023 10:12:19 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_y8B+SllHbojAA--.9890S3;
	Sat, 14 Oct 2023 10:12:17 +0800 (CST)
Subject: Re: [PATCH v2 1/8] objtool/LoongArch: Enable objtool to be built
To: Huacai Chen <chenhuacai@kernel.org>
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
 <1696856590-30298-2-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7NQM_W-T80UdPy0F7jUFa-eWKLymoLHkgUGoAGzZPUTQ@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <872be5af-26f0-34db-dedb-0d6ecb7092c0@loongson.cn>
Date: Sat, 14 Oct 2023 10:12:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7NQM_W-T80UdPy0F7jUFa-eWKLymoLHkgUGoAGzZPUTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_y8B+SllHbojAA--.9890S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur47Ar4rGrWUCFWxCw47Jrc_yoWkZrc_uw
	17Wa1kur1rXFWft3Z0vF95uF98GayrZrs5ArWvqr43W3Z8ta1DGFZrX348Zr45K3yvvFsx
	CFZ5Jr13CrnFgosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeQ6JUUUUU=



On 10/10/2023 08:45 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Mon, Oct 9, 2023 at 9:03 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Add the minimal changes to enable objtool build on LoongArch,
>> most of the functions are stubs to only fix the build errors
>> when make -C tools/objtool.
>>
>> This is similar with commit e52ec98c5ab1 ("objtool/powerpc:
>> Enable objtool to be built on ppc").

...

>> diff --git a/tools/objtool/arch/loongarch/include/arch/special.h b/tools/objtool/arch/loongarch/include/arch/special.h
>> new file mode 100644
>> index 0000000..1a8245c
>> --- /dev/null
>> +++ b/tools/objtool/arch/loongarch/include/arch/special.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef _OBJTOOL_ARCH_SPECIAL_H
>> +#define _OBJTOOL_ARCH_SPECIAL_H
>> +
>> +/*
>> + * See more info about struct exception_table_entry
>> + * in arch/loongarch/include/asm/extable.h
>> + */
>> +#define EX_ENTRY_SIZE 12
>> +#define EX_ORIG_OFFSET 0
>> +#define EX_NEW_OFFSET 4
> Other archs use tab for indentation in special.h
>

OK, thank you, will do it.

Thanks,
Tiezhu

