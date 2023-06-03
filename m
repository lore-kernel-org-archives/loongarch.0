Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6692D816
	for <loongarch@lists.linux.dev>; Sat,  3 Jun 2023 02:07:52 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8DxNvF3oHpkPtMDAA--.8237S3;
	Sat, 03 Jun 2023 10:07:51 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxXrN2oHpkEbyGAA--.22083S3;
	Sat, 03 Jun 2023 10:07:50 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch: Add support to clone a time namespace
To: Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
 <87bki0hn4y.ffs@tglx> <d9684f7b-871a-e759-d6b8-4556719702a1@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Christian Brauner <brauner@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <cc45475e-3d87-efa5-1c3a-c2c70d6aca94@loongson.cn>
Date: Sat, 3 Jun 2023 10:07:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d9684f7b-871a-e759-d6b8-4556719702a1@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxXrN2oHpkEbyGAA--.22083S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kr1UCFWfAryUuFWxJF4UXFb_yoW8Cw47pF
	97Wan8Kw4kWF15tF9rt3WDXFyrKws3ZFWUWryYv348CasY9wn5Jr48t3y8uFyrJr1kJ34I
	v348trWa934UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

Hi, Tiezhu

On 05/31/2023 06:04 PM, Tiezhu Yang wrote:
>
>
> On 05/31/2023 05:21 PM, Thomas Gleixner wrote:
>> On Wed, May 31 2023 at 15:56, Tiezhu Yang wrote:
>>> When execute the following command to test clone3 on LoongArch:
>>>
>>>   # cd tools/testing/selftests/clone3 && make && ./clone3
>>>
>>> we can see the following error info:
>>>
>>>   # [5719] Trying clone3() with flags 0x80 (size 0)
>>>   # Invalid argument - Failed to create new process
>>>   # [5719] clone3() with flags says: -22 expected 0
>>>   not ok 18 [5719] Result (-22) is different than expected (0)
>>>
>>> This is because if CONFIG_TIME_NS is not set, but the flag
>>> CLONE_NEWTIME (0x80) is used to clone a time namespace, it
>>> will return -EINVAL in copy_time_ns().
>>
>> Which means that test case is broken.
>>
>>> With this patch, the following failed test can be fixed too:
>>
>> You cannot fix a broken test case by enabling functionality which
>> is not guaranteed to be available on all platforms.
>>
>> Adding time name spaces on loongarch is a completely separate issue and
>> has absolutely nothing to do with broken test cases.
>>
>> They are still broken when CONFIG_TIME_NS is disabled in Kconfig, no?
>>
>> So this wants to be two separate things:
>>
>>    1) Fix the broken test cases so they handle CONFIG_TIME_NS=n
>>       situations correctly
>>
>>    2) Add support for TIME_NS to loongarch
>>

With this patch, we should also modify the stack_top() implementation,
because the vvar size is not PAGE_SIZE at this time.

'maps' before the patch,
  # sudo cat /proc/1/maps
  ...
  7ffffbec8000-7ffffbeec000 rw-p 00000000 00:00 0 
   [stack]
  7ffffc7d8000-7ffffc7dc000 r--p 00000000 00:00 0 
   [vvar]
  7ffffc7dc000-7ffffc7e0000 r-xp 00000000 00:00 0 
   [vdso]

STACK_TOP = TASK_SIZE - PAGE_ALIGN(current->thread.vdso->size) - VVAR_SIZE

Thanks,
Youling.

>
>
> Thanks for your reply and detailed suggestions,
> I will do it in the next version.
>
> Thanks,
> Tiezhu
>

