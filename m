Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A62EDA
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 07:58:59 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxyOnCIGtkVNsKAA--.18839S3;
	Mon, 22 May 2023 15:58:58 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_8u_IGtk081uAA--.54939S3;
	Mon, 22 May 2023 15:58:56 +0800 (CST)
Subject: Re: [PATCH] perf symbol: Add LoongArch case in get_plt_sizes()
To: Huacai Chen <chenhuacai@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
References: <1683615352-10794-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>
 <20230518030618.GB1068119@leoy-yangtze.lan>
 <CAAhV-H6L9kNyGU2UrX7jyN_6O_pafSVSamP7DYHkzfMgmCxVXA@mail.gmail.com>
 <20230518032129.GC1068119@leoy-yangtze.lan>
 <CAAhV-H6_=qwheWvNozop2+9MexnOZQcva28xaeikCc49_DqABA@mail.gmail.com>
 <20230518040553.GE1068119@leoy-yangtze.lan> <ZGYXKnRZQh18D2Fd@kernel.org>
 <CAAhV-H40kQf5WD-8ozFwS6copfQaGtUJqm=nvQ6btXZnpDmZFA@mail.gmail.com>
Cc: Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <387463f9-adb0-8e98-1de6-cae7a79a7d03@loongson.cn>
Date: Mon, 22 May 2023 15:58:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H40kQf5WD-8ozFwS6copfQaGtUJqm=nvQ6btXZnpDmZFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_8u_IGtk081uAA--.54939S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxur1rAw45urWUCFy3XFW7CFg_yoW5Cw1xpr
	Wqka1ktF4Dtr13Cwnrtr10kr4IqrWxAFWjgryUtw48AF9IvFn7Kr4xAw4Y9F13Gr1xCw12
	kr18W3yI9F18X3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0mhrUUUUU=



On 05/22/2023 11:50 AM, Huacai Chen wrote:
> Hi, Arnaldo,
>
> On Thu, May 18, 2023 at 8:16 PM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
>>
>> Em Thu, May 18, 2023 at 12:05:53PM +0800, Leo Yan escreveu:
>>> On Thu, May 18, 2023 at 11:57:29AM +0800, Huacai Chen wrote:
>>>> On Thu, May 18, 2023 at 11:21 AM Leo Yan <leo.yan@linaro.org> wrote:
>>>>>
>>>>> On Thu, May 18, 2023 at 11:12:26AM +0800, Huacai Chen wrote:
>>>>>> On Thu, May 18, 2023 at 11:06 AM Leo Yan <leo.yan@linaro.org> wrote:
>>>>>>>
>>>>>>> On Thu, May 18, 2023 at 10:11:27AM +0800, Huacai Chen wrote:
>>>>>>>> Queued, thanks.
>>>>>>>
>>>>>>> The patch is fine for me.
>>>>>>>
>>>>>>> Should not perf patches are to be merged via Arnaldo's tree?
>>>>>>
>>>>>> I think both are OK, if Arnaldo takes this patch, I will drop it.
>>>>>
>>>>> A good practice is to firstly inquiry the maintainers.
>>>>>
>>>>> AFAIK, Arnaldo will test perf patches before sending out pull request;
>>>>> if perf patches are scattered out, it might be out of the testing
>>>>> radar.
>>>> OK, I know, thank you very much.
>>>
>>> You are welcome!
>>>
>>> I found the code base for bfd:
>>> https://github.com/bminor/binutils-gdb/blob/master/bfd/elfnn-loongarch.c
>>>
>>> And this patch is consistent with above link, FWIW:
>>>
>>> Reviewed-by: Leo Yan <leo.yan@linaro.org>
>>
>> Thanks, applied.
> I'm very sorry that this patch breaks cross-build. We need some
> additional modification.
>
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 5d409c26a22e..b3dbf6ca99a7 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -35,6 +35,10 @@
>  #define EM_AARCH64     183  /* ARM 64 bit */
>  #endif
>
> +#ifndef EM_LOONGARCH
> +#define EM_LOONGARCH   258
> +#endif
> +
>  #ifndef ELF32_ST_VISIBILITY
>  #define ELF32_ST_VISIBILITY(o) ((o) & 0x03)
>  #endif
>
> Then, drop this patch to get an updated version, or let me send an
> incremental patch?
>

I tested this patch on native LoongArch and x86 system, I did not
hit the build error about undeclared EM_LOONGARCH both on LoongArch
and x86, because EM_LOONGARCH is defined in /usr/include/elf.h

Here is the x86 system info:

[root@fedora yangtiezhu]# cat /etc/fedora-release
Fedora release 38 (Thirty Eight)
[root@fedora yangtiezhu]# uname -m
x86_64
[root@fedora yangtiezhu]# grep -rn -w EM_LOONGARCH /usr/include/
/usr/include/linux/elf-em.h:54:#define EM_LOONGARCH    258    /* 
LoongArch */
/usr/include/linux/audit.h:442:#define AUDIT_ARCH_LOONGARCH32 
(EM_LOONGARCH|__AUDIT_ARCH_LE)
/usr/include/linux/audit.h:443:#define AUDIT_ARCH_LOONGARCH64 
(EM_LOONGARCH|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
/usr/include/elf.h:361:#define EM_LOONGARCH    258    /* LoongArch */
[root@fedora yangtiezhu]# rpm -qf /usr/include/elf.h
glibc-headers-x86-2.37-1.fc38.noarch

If I am missing something, please let me know.

Anyway, it is not a bad thing to add the EM_LOONGARCH definition
to avoid the build error on some systems which have no EM_LOONGARCH
in the glibc header.

Thanks,
Tiezhu

