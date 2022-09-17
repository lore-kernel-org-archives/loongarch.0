Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8946BA
	for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663448529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exjrZBoAB9OswSJ+2snEFZtWR7Bm/d7rxWnSNZBLWA4=;
	b=VyeMxKPAkHp/Dhhr8Nh8loJSuO28Uu80CFTL3JktPtJzqte49s2cVSdsBIMr9lgpnhyGhS
	mEjv7cpsf73nUP8c6ZpmrYAPgV99icSBNjxahPYbDT/vU7TTOpdTAYkIa7TxITUU4aFxwf
	RWGbjU5RHDuvbOU+//Spy7OdY9e6SDw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-hcYsEv-nOja-9ZAgQDLO0A-1; Sat, 17 Sep 2022 17:02:08 -0400
X-MC-Unique: hcYsEv-nOja-9ZAgQDLO0A-1
Received: by mail-ej1-f70.google.com with SMTP id sb32-20020a1709076da000b0077faea20701so6764248ejc.10
        for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 14:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=exjrZBoAB9OswSJ+2snEFZtWR7Bm/d7rxWnSNZBLWA4=;
        b=0RaChzPVMiEOIkt/g7y00PnDBuMOksjioFKh8Z2tLXLGodjeN+3URaHY3J69d2dQLH
         r0hu79C3I6KkBJlW32+whqLRkLclRD6JQUOLZokkjak6J3F8/HLeKTnEoqEauuV6m5Be
         iCL2Zg+93Dv3ad6LdE7NYuZcxkEudycZ/MXzQwPgErLO7D8TdJbZfjCty6tZHVtggHHT
         l82qiC6+6Vo6PGq/YtaXUfiF+mNhFecA9POoQq27WDShTQYTYWNmrZymIQoDEbzGDT1U
         0XFHRKx0T1HLQwQGAGJtGguYFrXOpx345irsjqxglUFV6CNLTnXVtW2bEkqtsYJyl/b/
         KnIQ==
X-Gm-Message-State: ACrzQf0sxr33vU/ypRnpHLiGJNTIz8YjqzTQOvtcush4SAtkPYsxVSBo
	jtA/LjDIxNa0qS6zdUTDw6v//4aA4zg2aW/LroD4Hecigo3P6/hakB+/wS4hqOydrar6B7/jO2T
	YUKOFmC9lwTOJYdbYIDuS
X-Received: by 2002:a05:6402:241e:b0:443:be9:83c0 with SMTP id t30-20020a056402241e00b004430be983c0mr9417560eda.24.1663448527316;
        Sat, 17 Sep 2022 14:02:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BDIYTlR9dOu6lgXF8p40ynxtoORH0r/SKn2QxzLu/3INeGEePtuPsB3l9DLjSPecp4ikOcQ==
X-Received: by 2002:a05:6402:241e:b0:443:be9:83c0 with SMTP id t30-20020a056402241e00b004430be983c0mr9417549eda.24.1663448527166;
        Sat, 17 Sep 2022 14:02:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l1-20020a1709060cc100b00780ab5a9116sm2880143ejh.211.2022.09.17.14.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 14:02:06 -0700 (PDT)
Message-ID: <8d9c5cb5-ef1e-d46e-bfa6-39c80e3f060e@redhat.com>
Date: Sat, 17 Sep 2022 23:02:06 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH V3] LoongArch: Add ACPI-based generic laptop driver
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Mark Gross <markgross@kernel.org>,
 loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220917065250.1671718-1-chenhuacai@loongson.cn>
 <80b46671-6d01-f2a2-7b9b-cb4c27cc87c6@redhat.com>
 <CAAhV-H7zwtJ06=2LQXg_uonRA8vzUif4AQNbzF_L2jewf7cVTA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAhV-H7zwtJ06=2LQXg_uonRA8vzUif4AQNbzF_L2jewf7cVTA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/17/22 17:39, Huacai Chen wrote:
> Hi, Hans,
> 
> On Sat, Sep 17, 2022 at 6:00 PM Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>>> +     /* Prepare input device, but don't register */
>>> +     generic_inputdev->name =
>>> +             "Loongson Generic Laptop/All-in-one Extra Buttons";
>>> +     generic_inputdev->phys = ACPI_LAPTOP_DRVR_NAME "/input0";
>>> +     generic_inputdev->id.bustype = BUS_HOST;
>>> +     generic_inputdev->dev.parent = NULL;
>>> +
>>> +     /* Init subdrivers */
>>> +     for (i = 0; i < ARRAY_SIZE(generic_sub_drivers); i++) {
>>> +             ret = generic_subdriver_init(&generic_sub_drivers[i]);
>>> +             if (ret < 0) {
>>> +                     input_free_device(generic_inputdev);
>>> +                     return ret;
>>> +             }
>>> +     }
>>
>> I see above that you have only 1 subdriver. Do you expect there to be
>> more in the future ?  If not then it would be better to just completely
>> remove the subdriver abstraction and simply do everything directly
>> from the main probe/remove functions (see below).
> At this time we only add the most basic subdriver, and more subdrivers
> will be added, so I want to keep it here.

Ok, that is fine.

Regards,

Hans

