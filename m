Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A801EA73;
	Thu, 22 Jun 2023 12:50:27 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxmMWMQ5RkvW8AAA--.747S3;
	Thu, 22 Jun 2023 20:50:20 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM2LQ5RkrxwCAA--.11455S3;
	Thu, 22 Jun 2023 20:50:19 +0800 (CST)
Subject: Re: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
References: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
 <202306220334.C80BpATp-lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <27295ba8-f57e-61c1-9cc4-f2207fd97ae0@loongson.cn>
Date: Thu, 22 Jun 2023 20:50:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202306220334.C80BpATp-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxWM2LQ5RkrxwCAA--.11455S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF1ktrWrtFWDtr1xCF13Jrc_yoW3Wrb_A3
	4aywsrGr1S9Fyqqws8CwsaqFyDJayUC3sruwn5Jw4DGFWIkw48Jws3W3srJF4kKrZxtw13
	ZasYqr9Yyw17KosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU



On 06/22/2023 04:04 AM, kernel test robot wrote:
> Hi Tiezhu,
>
> kernel test robot noticed the following build warnings:
>

...

>    In file included from include/asm-generic/bitsperlong.h:5:
>>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]

Oh, thanks for the report, I am sorry.

In order to silence the build warning, it should check the definition
of __BITS_PER_LONG first at the beginning of bitsperlong.h, like this:

#ifndef __BITS_PER_LONG

#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
#else
#define __BITS_PER_LONG 32
#endif

#endif

I will test and then send v3 later.

Thanks,
Tiezhu

