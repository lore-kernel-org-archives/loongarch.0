Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440641;
	b=wfBsTjjxidGlGiMIozJtK2r2dsXelPCLMyorkKwE4bMQnkv+gRiV4iccE8bAxRk2wfhW
	 jOXnpYbTenMaPowHqmtAj0KvVwe6tJxjcbNvAE/Bc4nxjwko6Jv34sIUGC+PjHrHPqZSh
	 ZXKFECyLv6HWyHPWTnBP5mBEIWmeo3bSzzaFlK/qfIt0tIiS/ThzhX0916aK5IEqO1Q5W
	 rbgHgnWLY2tc6mrP1LZbyy512kFBIHWsWLr1l/P3mt5RGA6CPag8OvgHykeurHzATSmNV
	 VcBzHtb62MozAN0cGOdDpu4fhokAIR6fd6e+0ECR/UnHoGoGjFGd7VbkEiF9pDxbNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440641;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=xBl4LenZgMO7u9uyhu6pCiLNFdtLVtDM8Nkt6YyrMJo=;
	b=dI4Y/narzwLUvgyCVBzBfKWOMxr/ph0YHom7W7/KJDdaASpzZR3JmjQAAR5cZe5naGYj
	 tLVuxNK4oF5X/Tjsch/6JoiNrR97VyVNiIL0GJ+CT/fBmnykpTFDRVd8dEMiz0uA4VLbm
	 4UICs3pXKHVVAud3EaxlE09MuhxqMdD7055Ks8WT4FF2Rdb/wC7twWi4kobQpqalIzjsJ
	 tjvARssYcoweTL6ebAStPzXtv8vVPdsuG+Xq1GpE1+NhKIbyNv2HOsX2xWu2mcDmi6XCK
	 jzbs3XEov4nxXYk6VmbVpKkYK3qrNXnVVhTRYCRr1g0G6brbmnvG6RhEV220+sb+AgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75A606A321
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 13:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED75A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpgz9t1795440566t4f637ce5
X-QQ-Originating-IP: GTrHbK18YCbs2CfsF9VuBtkgPArveTdhmkzt+7qYrNE=
Received: from [192.168.50.3] ( [113.246.116.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 21:29:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1721452454829110470
Message-ID: <07E7C8DDC6521658+9b2f67d7-b3d9-45d7-b86f-39bea74869f2@kylinsec.com.cn>
Date: Mon, 23 Nov 2026 21:29:44 +0800
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
Subject: Re: [PATCH v2] platform/loongarch: laptop: Fix backlight device
 lifetime on unload
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Yao Zi <ziyao@disroot.org>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Zixing Liu <liushuyu@aosc.io>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <9F3855F1130E2878+20261121131820.6759-1-luoqiu@kylinsec.com.cn>
 <awQSXIASqC_MdC5u@ashevche-desk.local>
Content-Language: en-US
From: Luo Qiu <luoqiu@kylinsec.com.cn>
In-Reply-To: <awQSXIASqC_MdC5u@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGmpL5CFYt/YgBDtf6vAlNUiXf8/TwJXXjRN3ywYqxLio27v2XPzJKur
	S2M4BSjFiff6dv4hM9cLQf72T5JyfXwrhRL79T/Eg8AydbGEYNzOjZ78ZtY9miWvyojvPCe
	FY11xCY28rdQ0c5DeVlwJqM+TVLjW5Qc110vS25y6k5G2jm+chNO3uq/cuSOHJarZtxvM6q
	dQp1faWwB0kvnQ2JNpOuyoYqzyt2h3exVaq3rgxzbgsfHlUOuytOEPxLO3vPBIRnLIX8QBt
	mXFCWis7KoeIX1VTvthB13WnSiZzuPkyt3ofLB6XpF9MEXojxHpHh+RqjnHIiYn/kMPWQTF
	r6P+lNI1l9t3k/hLSNODCeZ8ST56hcI8InH9fer52GGOqF28yqXg53SF7TXR6WKHo9XKfup
	/YjTVY0tULIhElOW416yKvnPUqrpM486rzMwJ9Rb+9nBqWrjuDWKKww6f6mqVx9lJO77ij9
	KkBZWrruIDgGG45qm+69f14hZF1px0TUjn3XeoFaBKDLk5J11W084c+Se2OLnjax+lVjluh
	XZgqk0m3aRtWre+W+nVGMfskqqz8WOuu9tEvjBCol7Og1G6R1z2fc1PwTnSy1zFKOyt+/dy
	pSUnRo2h9VtKXKXyh2jxARsj8Ww9GY52s73feLazk0Gou8Ae2ebHOs/wuLPdezGwGbxNc6X
	aaSudSHGpdd6ICh8An+g/zcI4EXBztR56djC4/WZ1uL3an/YOAX2q1KnqO1QJih6DoeUd7G
	nYC+9n/co2cOeZRKzlCxHN+WATJ+7tYW+AsItIfQc6L2Zrc1MbfBaAjB/rdQDdKsoiE1bZF
	zR0Hi6hBx448cP+ZRV9+7YdFWGwyW9+miodxe9zgmfkosCdj1MfHNpAeZ1zvdIF8HrAE+8l
	E8q/22lieOKwydQTe9qjqh8GSCEW4qSa97kSE0z3Nl9/+9m9V4k1Igbc3UYfJHVud8H0oYR
	Gw6Z3BsJUyn0PyxCsqAoXEDyhB1A8cxqSBbAjqR/uwmAEyqO4dIv3M3Bj8T7MB6X3WvCz2H
	rzSRD+4sH1lMTpf7Ot8Z/PIivyIP6hLqJQnpPpCZz4ZeS2cC8HRFmJTmokr+NaaL+tzJ2D7
	3WnXDRRXaehKZe5NIj9pS46pE7LAMLkTjtXud8cCxmC
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0


On 11/23/26 6:15 PM, Andy Shevchenko wrote:
> On Sat, Nov 21, 2026 at 09:18:20PM +0800, Luo Qiu wrote:
>> The driver registers a platform backlight device during module init but
>> discards the returned pointer. Consequently, the device is never
>> unregistered when the module is removed, leaving its ops callbacks
>> pointing into freed module text. After module removal, reading the
>> backlight's actual_brightness attribute can call the stale callback and
>> crash the kernel. Registration failures are also silently ignored.
>>
>> Store the returned pointer, use it for resume, and unregister it on
>> module exit. Check and report backlight registration failures.
> ...
>
>> static int loongson_hotkey_resume(struct device *dev)
>>   {
>>   	int status = 0;
>>   	struct key_entry ke;
>> -	struct backlight_device *bd;
>>   
>> -	bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
>> -	if (bd) {
>> -		loongson_laptop_backlight_update(bd) ?
>> +	if (backlight_dev) {
>> +		loongson_laptop_backlight_update(backlight_dev) ?
>>   		pr_warn("Loongson_backlight: resume brightness failed") :
>> -		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
>> +		pr_info("Loongson_backlight: resume brightness %d\n",
>> +				backlight_dev->props.brightness);
> Indentation is broken here.
Hi Andy,

Thanks for the review. I have fixed the formatting issues in v3.

https://lore.kernel.org/all/C95EAA0918240E5D+20261123131944.77149-1-luoqiu@kylinsec.com.cn/


Qiu Luo
>
>>   	}
> ...
>
>> static int laptop_backlight_register(void)
>>   {
>>   	int status = 0, ret;
>>   	struct backlight_properties props;
>> +	struct backlight_device *bd;
>>   
>>   	memset(&props, 0, sizeof(props));
>
>>   	props.power = BACKLIGHT_POWER_ON;
>>   	props.type = BACKLIGHT_PLATFORM;
>>   
>> -	backlight_device_register("loongson_laptop",
>> +	bd = backlight_device_register("loongson_laptop",
>>   				NULL, NULL, &backlight_laptop_ops, &props);
> ...and here.
>
>> +	if (IS_ERR(bd))
>> +		return PTR_ERR(bd);
>>   
>> +	backlight_dev = bd;
>>   
>>   	return 0;
>>   }

