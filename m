Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898B96127
	for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxBOt82ItlUvYEAA--.19578S3;
	Wed, 27 Dec 2023 15:55:40 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxt+Z42ItlT4AMAA--.44482S3;
	Wed, 27 Dec 2023 15:55:37 +0800 (CST)
Subject: Re: [PATCH v3 0/2] selftests/vDSO: Fix errors on LoongArch
To: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>
References: <20231213012300.5640-1-yangtiezhu@loongson.cn>
Cc: linux-kselftest@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d73d107d-9e04-4250-f467-f6ff7eb92103@loongson.cn>
Date: Wed, 27 Dec 2023 15:55:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231213012300.5640-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Dxt+Z42ItlT4AMAA--.44482S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtr13AF1kZF18Gr1fZw17twc_yoWftrb_uF
	W8ua4kGrZ7uFZ8AF4Fqw1rZry3JF4Iyr4xWryj9w47Jr9rArZ8GF4FkF48uFySgrWayr9r
	JF4DCa9avr1qqosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_Ma
	UUUUU

+ Andrew Morton <akpm@linux-foundation.org>
+ Mark Brown <broonie@kernel.org>

On 12/13/2023 09:22 AM, Tiezhu Yang wrote:
> v3: Rebase on the next branch of linux-kselftest.git,
>     modify the patch title and update the commit message
>
> v2: Rebase on 6.5-rc1 and update the commit message
>
> Tiezhu Yang (2):
>   selftests/vDSO: Fix building errors on LoongArch
>   selftests/vDSO: Fix runtime errors on LoongArch
>
>  tools/testing/selftests/vDSO/vdso_config.h    |  6 ++++-
>  .../testing/selftests/vDSO/vdso_test_getcpu.c | 16 +++++-------
>  .../selftests/vDSO/vdso_test_gettimeofday.c   | 26 +++++--------------
>  3 files changed, 18 insertions(+), 30 deletions(-)
>

Hi Shuah, Andrew and Mark,

The patches still seem to apply cleanly.
Could you please review and merge them for the upcoming merge window?

https://lore.kernel.org/lkml/20231213012300.5640-1-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

