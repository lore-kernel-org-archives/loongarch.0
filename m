Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F40658
	for <loongarch@lists.linux.dev>; Thu, 12 Oct 2023 01:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxbetrUSdl2ToxAA--.26865S3;
	Thu, 12 Oct 2023 09:52:43 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt5pUSdlsjYhAA--.6621S3;
	Thu, 12 Oct 2023 09:52:41 +0800 (CST)
Subject: Re: [PATCH v2 0/2] Modify vDSO selftests
To: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <1689069425-17414-1-git-send-email-yangtiezhu@loongson.cn>
 <6aafe4f7-5b20-e791-12c1-413f2db3417b@loongson.cn>
Cc: linux-kselftest@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 Andrew Morton <akpm@linux-foundation.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <379c1f53-3e32-0033-3658-6689f43e7f1f@loongson.cn>
Date: Thu, 12 Oct 2023 09:52:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6aafe4f7-5b20-e791-12c1-413f2db3417b@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cxzt5pUSdlsjYhAA--.6621S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtr1ftw4xKryDXw45KFW5CFX_yoWfurbE9a
	y8uas3tws7ZF9xAF4Sgw13ZryDJayIyr4UKr17Way7Xry3ZFWUWF4kur48u3WrWa17trZ2
	yF4UZasavryDXosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=

Cc: Andrew Morton <akpm@linux-foundation.org>

On 08/17/2023 03:20 PM, Tiezhu Yang wrote:
> Hi Shuah,
>
> On 07/11/2023 05:57 PM, Tiezhu Yang wrote:
>> v2: Rebase on 6.5-rc1 and update the commit message
>>
>> Tiezhu Yang (2):
>>   selftests/vDSO: Add support for LoongArch
>>   selftests/vDSO: Get version and name for all archs
>>
>>  tools/testing/selftests/vDSO/vdso_config.h         |  6 ++++-
>>  tools/testing/selftests/vDSO/vdso_test_getcpu.c    | 16 +++++--------
>>  .../selftests/vDSO/vdso_test_gettimeofday.c        | 26
>> ++++++----------------
>>  3 files changed, 18 insertions(+), 30 deletions(-)
>>
>
> Any comments? I guess this should go through the linux-kselftest tree.
>
> Thanks,
> Tiezhu
>

What are the status of these patches?

https://lore.kernel.org/lkml/1689069425-17414-1-git-send-email-yangtiezhu@loongson.cn/

This is a ping message, maybe you have forgot them?

Thanks,
Tiezhu

