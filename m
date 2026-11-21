Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221924;
	b=rvmtE7cuzQpo12+89kyYR3fKfAAtCsY6Y8IPUDN1aXnTU1MXDQtNrsXEBsDFXc0on0za
	 ICcTSHTExqCijFvubZaYoOfJNrSaUoWKuJAVDALGQbJoW/YvVPjP7crA1oU1B7vVRl8IJ
	 iJtESOC0LmkYjYjUGqlmq6lQQvFrPvM6H5MDAqb5+1UMH6z343vhkAl2uHeck7ruuGKQS
	 K48ZE5Ah/+ziDR0dGm4cIys8xp0sGwgfq+GpiDP+O8ybfkEaE9xGnfbP/2Fe6wxYF5KHO
	 deSdyzxPJ9t+eOWjhNmiTQ6EYvsjjv2RZbv66FUtg+pgNwuSvxZO66dWM9vrisk1f2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221924;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=wJW+40nF/GQo4qoIjCf6SARWpRHQ7H2pfRgqL2CtGG8=;
	b=fRIvMh/eiLudQeoMPyMvwSoHWersOFF2FAUSm+abc6DHQCcKtChACYLR2R+esmI0WcDv
	 wSCyHofYHJPskaB1+qXVinexSU/5LhUJpn33t+G46t2nided6s6J3isqlH+V6XzYJRIUO
	 EjeVsnqRmu30KfP8vJNEgWEyipDYoup9COc1q1l61jBfn0E6M0pAJR7Ln6ElecvlB6it0
	 x3dYEuymatsFPsSyvrefN8rQiY/SveHNJ260W2XKlxvadrxMjnMyciee80UqFxXBEazK5
	 5Re2FlZPY/FOOPj6QHpljpLsGuiCUt6Htl6LwO9VH5STPK4menCjM/8m12dckXWvmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25020606A6AE
	for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 00:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25020606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpgz5t1795221839t002b40ea
X-QQ-Originating-IP: 7wS3+5A+uu5zsLmDUp+3xxbRo7iKjj7aXaBavT7rNPA=
Received: from [10.20.30.2] ( [175.0.188.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Nov 2026 08:43:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15264283437573830944
Message-ID: <6C1A5340F9F491C3+2f4be193-b25b-4386-89e5-654277569ad6@kylinsec.com.cn>
Date: Sat, 21 Nov 2026 08:42:10 +0800
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
 <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
 <CAAhV-H4PM0iPH0mBQy=Tj16b2o_5zNwzEyjd8LqMMQeRQpDxNg@mail.gmail.com>
Content-Language: en-US
From: Luo Qiu <luoqiu@kylinsec.com.cn>
In-Reply-To: <CAAhV-H4PM0iPH0mBQy=Tj16b2o_5zNwzEyjd8LqMMQeRQpDxNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfykWmRlrd2oJY1f2fs5ltHdmHuJK7VVRQiTWSEBHnACtiWsX+WVI36A
	0pxXnDFOf1FlJ+kRWUJJ36vtpXqwmj3xZAGJkkmY73pWKBl2ILIw84tsArFJD7yNocgu5Rj
	y0GhcSDdLeZFVCD42uiOZxHkiAAMhDBpw4SzrTkFp4ObsQ+HkUelNzTs1xIZJcjxejjcj5T
	gArf6dpAI0fOlvmMZA0gGtf7VnSMxYk2DZxyUQ78+i5yOObJy6/qbjy3cvq0TAmnbaodiXg
	asu4gnW4AckIVVuDQkVHTU+H0QpnSik56TQ7x8r1xKLykrrxvuuynM/3j8sz0jv982wp5fh
	w+R/ts4c5uIrf+UksGpXZhA+CIN5/p0HpzazxjmPPfd0qRNgI7ozBtMQslDZurPsMrFPoLP
	XQcCsnbOkcK5ITIHJz0YORUE6/OQL3+E9x4K5gLxmQgCvMPAUHGhvzu7rQMwUhJSv/xF9OB
	QnkHf3hnJrZVGQ643UctH/YT42o9MSzB0Orrr89FsLX075usteIywb5D6lnnPR4skwxw/hN
	j9SmxZ6rQkvzTF+ebj2XS5gyBqIcM9pc7twpkQYO1kx/g7cNwHkskfI4KgTZZ6qPgplDnDJ
	90iZ3XoiT4GHmEunqHMQ23X5aEh4dzyJFBRlH5XZy/BBwsDqq6XKxfaFv3cGJ1awgKccYo4
	UObmcsGk6mXc7oRQLxl0VjCjs06boDFEb+5jm35xNlBrgk/3ELY302ZD82Sl51+2YlFmL88
	nhmDjl1LyuOy8XfaWDbBpOYiFvwBt9Sqh/Vh+njRwCLKDyTcDJVpqlnNbJE9C4CKxg7i+xG
	Ij/VTWFgIGBwhR8EVYlHVa19e7CCU4uxSR0o2Y6AtQtsbBTIB9NmVLW91ZxG1sWnYfbk2DH
	99MsY+ZMHngbeNdHEnSYLCeR8aAjkiWXnKKDKM0qhkxgM3MP/o4aeLiuH+YPFjOXKCS+H1F
	nvxKeY5Uy+pIdYtcw6BsScqv5iUwnA0b1WieU5lqKqYB05OblgPAsxUlZ4wUnbVmtaBv7Hv
	bTxi0zvAfsnNNtTdPdwhUNLMbp1q8AIePgEKjyp6fcKBskFI4e+gz8WS4Walc=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0


On 11/20/26 6:16 PM, Huacai Chen wrote:
> On Fri, Nov 20, 2026 at 5:13 PM Luo Qiu <luoqiu@kylinsec.com.cn> wrote:
>>
>> On 11/20/26 4:16 PM, Huacai Chen wrote:
>>> Hi, Qiu,
>>>
>>> On Thu, Nov 19, 2026 at 8:22 PM Luo Qiu <luoqiu@kylinsec.com.cn> wrote:
>>>> The driver registers a platform backlight device during module init but
>>>> discards the returned pointer. Consequently, the device is never
>>>> unregistered when the module is removed, leaving its ops callbacks
>>>> pointing into freed module text. After module removal, reading the
>>>> backlight's actual_brightness attribute can call the stale callback and
>>>> crash the kernel. Registration failures are also silently ignored.
>>>>
>>>> Store the returned pointer, use it for resume, and unregister it on
>>>> module exit. Propagate registration failures to avoid silently
>>>> continuing without a backlight device.
>>>>
>>>> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
>>>> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
>>>> ---
>>>>    drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
>>>>    1 file changed, 13 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
>>>> index 4ec56621db24..ec0742e5ed46 100644
>>>> --- a/drivers/platform/loongarch/loongson-laptop.c
>>>> +++ b/drivers/platform/loongarch/loongson-laptop.c
>>>> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
>>>>    static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>>>>
>>>>    static bool bl_powered;
>>>> +static struct backlight_device *backlight_dev;
>>>>    static int loongson_laptop_backlight_update(struct backlight_device *bd);
>>>>
>>>>    /* 2. ACPI Helpers and device model */
>>>> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *dev)
>>>>    {
>>>>           int status = 0;
>>>>           struct key_entry ke;
>>>> -       struct backlight_device *bd;
>>>>
>>>> -       bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
>>>> -       if (bd) {
>>>> -               loongson_laptop_backlight_update(bd) ?
>>>> +       if (backlight_dev) {
>>>> +               loongson_laptop_backlight_update(backlight_dev) ?
>>>>                   pr_warn("Loongson_backlight: resume brightness failed") :
>>>> -               pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
>>>> +               pr_info("Loongson_backlight: resume brightness %d\n",
>>>> +                               backlight_dev->props.brightness);
>>>>           }
>>>>
>>>>           /*
>>>> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
>>>>    {
>>>>           int status = 0, ret;
>>>>           struct backlight_properties props;
>>>> +       struct backlight_device *bd;
>>>>
>>>>           memset(&props, 0, sizeof(props));
>>>>
>>>> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
>>>>           props.power = BACKLIGHT_POWER_ON;
>>>>           props.type = BACKLIGHT_PLATFORM;
>>>>
>>>> -       backlight_device_register("loongson_laptop",
>>>> +       bd = backlight_device_register("loongson_laptop",
>>>>                                   NULL, NULL, &backlight_laptop_ops, &props);
>>>> +       if (IS_ERR(bd))
>>>> +               return PTR_ERR(bd);
>>>>
>>>> +       backlight_dev = bd;
>>>>
>>>>           return 0;
>>>>    }
>>>> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
>>>>                                   generic_subdriver_exit(&generic_sub_drivers[i]);
>>>>                   }
>>>>           }
>>>> +
>>>> +       backlight_device_unregister(backlight_dev);
>>> backlight_device_register is called conditionally but
>>> backlight_device_unregister() is called unconditionally, I think this
>>> is wrong.
>>>
>>> Huacai
>> Hi, Huacai.
>>
>> Thanks for the review. The unconditional call is intentional and is safe
>>
>> because backlight_device_unregister() explicitly accepts a NULL device:
>>
>>       void backlight_device_unregister(struct backlight_device *bd)
>>       {
>>           if (!bd)
>>               return;
>>           ...
>>       }
>>
>> backlight_dev is statically initialized to NULL. It is only assigned after
>> backlight_device_register() succeeds and the IS_ERR() check has passed. If
>> registration is skipped or fails, the pointer remains NULL, so the call in
>> the module exit path is a no-op rather than a NULL dereference.
>>
>> I can change it to `if (backlight_dev) backlight_device_unregister(...)` in
>> a follow-up if you prefer that style.
> Yes, I think that is better. And it is also better to put this block
> before the "if (generic_inputdev)" block.
Thanks for the suggestion. I would prefer to keep the backlight
unregistration after the generic_inputdev cleanup block.

loongson_hotkey_resume() accesses backlight_dev, and that resume callback
belongs to loongson_hotkey_driver, which is only unregistered by
generic_subdriver_exit(). If we unregister the backlight before that block,
the PM callback remains reachable while its backlight_dev dependency may
already have been released.

The backlight device itself is independent of generic_inputdev. The
ordering is required by the hotkey PM callback lifetime, rather than by a
device dependency between the backlight and the input device.

I think keeping the teardown order as:

     generic_inputdev/generic_subdriver_exit()
     backlight_device_unregister()

is safer.

Qiu Luo

>
> Huacai
>
>> Thanks.
>>
>> Qiu Luo
>>>> +       backlight_dev = NULL;
>>>>    }
>>>>
>>>>    module_init(generic_acpi_laptop_init);
>>>> --
>>>> 2.56.1
>>>>
