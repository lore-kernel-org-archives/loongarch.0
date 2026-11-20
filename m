Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166052;
	b=4ZUoHUmw33eumwTBvT335X7xfTdCXhApaJZ2vPtWrWyfkK5Rv2BufVowY6W7NSZOmQHJ
	 4647y3bGWqDbxtQnS0HVvruCvYm98iMqH7++AS+9japEShos3lw0idwmZ4Gnq7FyHk5cJ
	 mI9dWbOHcsXA9E5jk0ezsOIdPXMu/cKJJb07gKu3pkmBcxA2vwVd9tiwOufdGzRZq2yys
	 +79avUBtjeL7GObOIJZKilXDM+sFuj44V84lz5xCZi7nL0tuceOc1ZWeM7oZ3Wx/FbytH
	 Sd9lgtPdm1e0/kjTtELR3eSxz3AT/rk7f1GWLgfqw9AZV9NeOUuKdn0CuwsIYhP2sxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166052;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=fawBJBxvqntIpfmYrM+MvGMXInte1Ysn4Da6nrX5kqg=;
	b=FdA95vgmha7OPmHuW9VM9vGWtwmdot5n0vuC0O+E0V+W9h+gWEofPUCNHyzz5XgF3Rjo
	 g/PuHxvg6BjEdVj47eH/0q+PtcjKTqfCnOybmSBu2G5lk4VSJ7N2O0Wzhq+j3lCLotsox
	 Rs/VgcU5jcUXVvciJp0ThqpBylPkrvZeuZEi3nF1lH/NT0M85BmZXZ5pa8JKOrXHlm1zY
	 N3RVwPlYNQffQ8AvdCxrrlotVRiWt1c5EKDHqo7M03fQW134BlPG1Rk0wvRNTyk6r74nu
	 WX7PI3buWAYxPXtRlVjc2pcHOFuwKK4M/KzV6CK/h2fqJp3NLaLb/9QS1qHMkf/L3bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E0606A331
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 09:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9E0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz7t1795165966t49380da1
X-QQ-Originating-IP: RR10wvzWiKKffj+G7uXXMQNsGus0me5IDeSj1QwZdwg=
Received: from [10.20.30.2] ( [175.0.188.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Nov 2026 17:12:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6020361651217184553
Message-ID: <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
Date: Fri, 20 Nov 2026 17:10:58 +0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
 <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Content-Language: en-US
From: Luo Qiu <luoqiu@kylinsec.com.cn>
In-Reply-To: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYKM/pSuXZkt6mljoerFCnC7yAEcNQVDTVIeZicIC8cz+z7+iQ6OvGpt
	7Tz4f2/1N1vraHij7M6M/8vk3y2aUTzHILRR3C5cDj+sAfIkUTwaILXQJN4OFMsWNXw5sSD
	lGJgyKL4LEXjcRijhBD6LUGN8OtfKQo7whS9ejX8Zw3da4CkLk0llwZpzDxcxxH32ks2Ake
	A42hLRrrHBUMUQDNo/peAikh8GNsBZ3JWlv6dgO8ycO1bnS+6znQF90n+Ph7w5SpASyuAL7
	2tBaaGWU6bUebJkcJpavtZ5Wc/hqvaFGQo03vWmiaG5YZxmy64nNISrzHuJsglV3ycwer/b
	jxcG8mDgR+0yW9WaMBk9dFAG8oNy6Z1WbjbeESDOVnU9V1B6YGg3BmD+j6SeD3Z6xISmik5
	fQPmb1NcGhJaajwM6rOsSnieYQeTmyD66ewamX0j1c+RkLI7DYhcZWRknQh0LY6+h8vYnI1
	IpvjESFkrMmfD6Wwci5BQlcPH50MrhfJQ6gvqiVsziG8lAGVa6Ug3i/JhObdrri9SCvDV2B
	pXlSExW+VQVd60dl2owlQs9MVweU//C8RptDjS1Ol9UD79TtGgZ9l+L5uP37SBOLweRQWx8
	NJDZvafHtcZzJZMyksahHq4TUmtdBsYbq3fIb8fSIzQLdyYsPk9EoSfQwoZx4+DbfJp00ZS
	t4Wo5UOOMtiBxbZ/WaXPHPD81v62vnd4dZYOaWN60F3eI3YLxVMdrBFILPCPCL7iYc0qWBV
	z3LDprV7e7/1gcdASkxmBebeIJCEn5Saemgn0CVgM9Gvd90U2eK57Keo2Y9NWOXxUxthOSO
	5HO6qB+RznOyMOLpDOJ/VoWi90032BWUNp4T03+4f4Xs6IA4kO+OTvukgvQt8L6cXW3Yp9v
	OPaswAQhmFDj7ArgLU551ML8j3zWIbJiTheKTQHSoheXaJXM8bwBvC46S7iuKQ5+HdRswyg
	z03Se5A9M9kXOJ0PcbsBZQ7eoeM4ibMBs+vGNIf3u+IBpHR2PvJ/kT4W+c3oikwLxOu1wZ4
	7YI7qVdY2V1zZZp+9b0oFIdYo9c1LY+6/JsGC1zY+yjBtEuaxfze2ZPJLctnW/YgLMMxLBg
	dyDXM6mIJbL
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0


On 11/20/26 4:16 PM, Huacai Chen wrote:
> Hi, Qiu,
>
> On Thu, Nov 19, 2026 at 8:22 PM Luo Qiu <luoqiu@kylinsec.com.cn> wrote:
>> The driver registers a platform backlight device during module init but
>> discards the returned pointer. Consequently, the device is never
>> unregistered when the module is removed, leaving its ops callbacks
>> pointing into freed module text. After module removal, reading the
>> backlight's actual_brightness attribute can call the stale callback and
>> crash the kernel. Registration failures are also silently ignored.
>>
>> Store the returned pointer, use it for resume, and unregister it on
>> module exit. Propagate registration failures to avoid silently
>> continuing without a backlight device.
>>
>> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
>> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
>> ---
>>   drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
>> index 4ec56621db24..ec0742e5ed46 100644
>> --- a/drivers/platform/loongarch/loongson-laptop.c
>> +++ b/drivers/platform/loongarch/loongson-laptop.c
>> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
>>   static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>>
>>   static bool bl_powered;
>> +static struct backlight_device *backlight_dev;
>>   static int loongson_laptop_backlight_update(struct backlight_device *bd);
>>
>>   /* 2. ACPI Helpers and device model */
>> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *dev)
>>   {
>>          int status = 0;
>>          struct key_entry ke;
>> -       struct backlight_device *bd;
>>
>> -       bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
>> -       if (bd) {
>> -               loongson_laptop_backlight_update(bd) ?
>> +       if (backlight_dev) {
>> +               loongson_laptop_backlight_update(backlight_dev) ?
>>                  pr_warn("Loongson_backlight: resume brightness failed") :
>> -               pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
>> +               pr_info("Loongson_backlight: resume brightness %d\n",
>> +                               backlight_dev->props.brightness);
>>          }
>>
>>          /*
>> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
>>   {
>>          int status = 0, ret;
>>          struct backlight_properties props;
>> +       struct backlight_device *bd;
>>
>>          memset(&props, 0, sizeof(props));
>>
>> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
>>          props.power = BACKLIGHT_POWER_ON;
>>          props.type = BACKLIGHT_PLATFORM;
>>
>> -       backlight_device_register("loongson_laptop",
>> +       bd = backlight_device_register("loongson_laptop",
>>                                  NULL, NULL, &backlight_laptop_ops, &props);
>> +       if (IS_ERR(bd))
>> +               return PTR_ERR(bd);
>>
>> +       backlight_dev = bd;
>>
>>          return 0;
>>   }
>> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
>>                                  generic_subdriver_exit(&generic_sub_drivers[i]);
>>                  }
>>          }
>> +
>> +       backlight_device_unregister(backlight_dev);
> backlight_device_register is called conditionally but
> backlight_device_unregister() is called unconditionally, I think this
> is wrong.
>
> Huacai
Hi, Huacai.

Thanks for the review. The unconditional call is intentional and is safe

because backlight_device_unregister() explicitly accepts a NULL device:

     void backlight_device_unregister(struct backlight_device *bd)
     {
         if (!bd)
             return;
         ...
     }

backlight_dev is statically initialized to NULL. It is only assigned after
backlight_device_register() succeeds and the IS_ERR() check has passed. If
registration is skipped or fails, the pointer remains NULL, so the call in
the module exit path is a no-op rather than a NULL dereference.

I can change it to `if (backlight_dev) backlight_device_unregister(...)` in
a follow-up if you prefer that style.

Thanks.

Qiu Luo
>
>> +       backlight_dev = NULL;
>>   }
>>
>>   module_init(generic_acpi_laptop_init);
>> --
>> 2.56.1
>>

