Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839110E9
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 06:39:06 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e132so1564249pgc.5
        for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 23:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=hvRrAuGM1kHUKhG33THxL0eJlLI2uU+5uJ5jA1dR9Lk=;
        b=U20ezyf5X+rLZixvA/lmckzqS+pZZqSJb2CZzXIhLIANmsNL7qXyIB+3jyJfHcCoNX
         CRJe1BUwqIeUgstjxH0/8Gc0EW7esgIaz5uNv84Vo+I6IPACsZXjhQ10p+R0lv7+f1VL
         y4cEyPZYt0JB+9NTTmthfnbjlvQRFrpO45uVoqEnmV6sGJg4s2HmDLDQs6m7LefThSAZ
         LZyntKJxy0hKzbuNBbFo1lptoTekHFyuFbRENMCEYvqChmI4vXhSFovD2oT27TBiiv1F
         NO13JvEH8PbB/hTy30pbnGks5FGRbvQOGnukhJ5CjWVwRLCiijoJKloblsoVs1ZHw198
         7dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=hvRrAuGM1kHUKhG33THxL0eJlLI2uU+5uJ5jA1dR9Lk=;
        b=ZHLjsjK4XvXO1Awh6mE35zxmKd3XLrCDsfzPFblCJl6XzTUTOflTst9pTjidvSCIL3
         w7gDTyRLCVkaYKsb3hXnlI7BT3GpO+EWwIONgb87n7Nmh9Oynbi9t0eQuHcNey/qEXyT
         nZo6rydnmYRzc0+DJQGYNM7lhouhUg4uOOCF53cYEOaV7D97g+kSWOYn2QP8ygSppupY
         Z1oNCLrs/5Uw4KEE1a3MLWYTiwMUxporcc7zGGUzP83dgpVUqJd9cCXeWnugbtZSZdZr
         uhMMgkHSGwukPlZ3hbAi/JQrPcsc+/VZEc0Wl8UBrlCxHx4z4MQg5Pb+HjeOj1Ueegxw
         bv8A==
X-Gm-Message-State: AJIora8H9ret1Bazt4cnP2hG3bOzoqdKwx0ehC3RoWoD+2ecFq7e45D2
	OUKuQEKPg8sabXxqsLEP/RI=
X-Google-Smtp-Source: AGRyM1ukVc5Tq22ULcvfowbLS+/guY3eeBFaZLAZkiSTwFZ2548EGLsxxBqB53uV5NP36vUWq8c9KA==
X-Received: by 2002:a65:604a:0:b0:3f9:f423:b474 with SMTP id a10-20020a65604a000000b003f9f423b474mr10822563pgp.527.1656657545514;
        Thu, 30 Jun 2022 23:39:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m20-20020aa79014000000b00525550222edsm14704564pfo.214.2022.06.30.23.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 23:39:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9427ebf1-8b5a-cebc-6ec4-2414197c24a8@roeck-us.net>
Date: Thu, 30 Jun 2022 23:39:00 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
References: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
 <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Building loongarch64 toolchain
In-Reply-To: <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/22 19:14, Huacai Chen wrote:
> Hi, Xuerui,
> 
> On Thu, Jun 30, 2022 at 10:06 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> I have been trying to build a toolchain for loongarch64 using gcc 12.1.0 and
>> binutils 2.38. Unfortunately, the resulting toolchain doesn't work for me.
>> Tracking down the problem, it turns out that gcc passes -mabi=lp64d to the
>> assembler, but the assembler only supports -mabi=lp64.
>>
>> Where can I find guidance on how to build a working toolchain ? Using the
>> available toolchain binaries is not an option.
> Could you please give some guidance?
> 

I ended up hacking binutils to accept all lp64 mabi variants.

--- binutils-2.38.orig/gas/config/tc-loongarch.c	2022-01-22 04:14:08.000000000 -0800
+++ binutils-2.38/gas/config/tc-loongarch.c	2022-06-30 07:41:29.545038901 -0700
@@ -142,7 +142,8 @@
    switch (c)
      {
      case OPTION_ABI:
-      if (strcasecmp (arg, "lp64") == 0)
+      if (!strcasecmp (arg, "lp64") || !strcasecmp (arg, "lp64d") ||
+          !strcasecmp (arg, "lp64s") || !strcasecmp (arg, "lp64f"))
  	{
  	  LARCH_opts.ase_abi |= EF_LOONGARCH_ABI_LP64;
  	  LARCH_opts.ase_ilp32 = 1;

With that, I am able to compile loongarch:defconfig. I'd still like
to understand the problem and avoid the hack, though.

Thanks,
Guenter
