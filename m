Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03B749C
	for <loongarch@lists.linux.dev>; Sun, 10 Sep 2023 16:46:27 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-792717ef3c9so141001839f.3
        for <loongarch@lists.linux.dev>; Sun, 10 Sep 2023 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694364387; x=1694969187; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=61vUwUdH6cPiu3s3z2+GRh4ZeJftNEs+VBuIsIetADI=;
        b=IwcfpbJ7UX/505XqFV19JMbB92MUOUThPhM2z01pDGHhDTznrgSu6cinRFUaYEPF/S
         58bK0ck9EslINPmC6YNEXM48ZR9UW7+muqbORtzKhqW/Cz9SoyZG8zR82j+QlwmekTK5
         Cu0Ho1buLcGu5OQHoYRudqb7aj8y4savEs7c348KqZMdmD+jUGtgedKGir+IfgXG8RUc
         FaIyOPDQ71LmUn2wdX/r4rrmkU6cFWOmO3RfWZ+BF9NA7xrXsy2QHM4VWrFH45bD+OUg
         LPs+Jv21fSIkKMHsWE0N6ISqZHbORcbaOW+WQiAEzVlyftoAlQfKQ1E1k3DGDoyMJ/li
         MXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694364387; x=1694969187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61vUwUdH6cPiu3s3z2+GRh4ZeJftNEs+VBuIsIetADI=;
        b=gALNGCg51VdRisFTemn8Sw1qs5dgx5TSYKn7NYNA5tHfhKPQRHDGee0YvhoJ9NszJe
         7Bgt5dvFtU2ELeqYKf08mCLXSsVGURYpFCa3vDG/UDq3mfOKWrVcEpOWOZ7u6QXflV95
         +Hho63USMNxcwfsu1x8zctBCj8Md5yQMAp2FrN9kciWOHSt6BBOspfDD9GfqVZHvtzkN
         CYcjeHaqded7iA7ewBKK+HhGBhAFr/9BnalIrPoT7arUjiy+Fa/5xqUwenVZOm0ocYbl
         wHjLk8n5Ek7dUmielW4011m8uE1/E535kgfP6eZzdqMTano6xyUHgPI6RgVPYdwSELkL
         YC4g==
X-Gm-Message-State: AOJu0Yzn6Dcn4iXldzx0MuuMblUsoGVUkbOYoc79IegZXrG9JNIEARi6
	VY3ny88B2eSWM60xDVpWuiw=
X-Google-Smtp-Source: AGHT+IGgV4IAnj8XcUmTKKNqDQ2+b2rj4LBcLwPs8Y3X5dYAgOIWmbTpL5Ylf8Z44iBvpovPN/sYaQ==
X-Received: by 2002:a6b:5915:0:b0:795:16b8:85fc with SMTP id n21-20020a6b5915000000b0079516b885fcmr9051442iob.0.1694364386703;
        Sun, 10 Sep 2023 09:46:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2-20020a5ec742000000b0078337cd3b3csm1729489iop.54.2023.09.10.09.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 09:46:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2520edfc-32a3-a838-ef80-337f20cd7d9c@roeck-us.net>
Date: Sun, 10 Sep 2023 09:46:23 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] LoongArch: Allow building with kcov coverage
To: Xi Ruoyao <xry111@xry111.site>, Feiyang Chen <chenfeiyang@loongson.cn>
Cc: chenhuacai@kernel.org, dvyukov@google.com, andreyknvl@gmail.com,
 loongarch@lists.linux.dev, kasan-dev@googlegroups.com,
 chris.chenfeiyang@gmail.com, loongson-kernel@lists.loongnix.cn
References: <cover.1688369658.git.chenfeiyang@loongson.cn>
 <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
 <66522279-c933-4952-9a5a-64301074a74a@roeck-us.net>
 <ed3d5214b0a84486080993b56c0de45accfe4fce.camel@xry111.site>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ed3d5214b0a84486080993b56c0de45accfe4fce.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/23 09:07, Xi Ruoyao wrote:
> On Sun, 2023-09-10 at 08:51 -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Tue, Jul 04, 2023 at 08:53:32PM +0800, Feiyang Chen wrote:
>>> Add ARCH_HAS_KCOV to the LoongArch Kconfig. Also disable
>>> instrumentation of vdso.
>>>
>>> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
>>
>> When trying to build loongarch:allmodconfig, this patch results in
>>
>> Error log:
>> In file included from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/options.h:8,
>>                   from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/tm.h:46,
>>                   from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/backend.h:28,
>>                   from /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/gcc-plugin.h:30,
>>                   from scripts/gcc-plugins/gcc-common.h:7,
>>                   from scripts/gcc-plugins/latent_entropy_plugin.c:78:
>> /opt/kernel/gcc-12.2.0-2.39-nolibc/loongarch64-linux-gnu/bin/../lib/gcc/loongarch64-linux-gnu/12.2.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
>>     31 | #include "loongarch-def.h"
> 
>> for me. I tried with gcc 12.2 / binutils 2.39 and gcc 13.1 / binutils 2.40.
> 
>> Reverting the patch or explicitly disabling CONFIG_GCC_PLUGINS fixes
>> the problem.
>>
>> What compiler / binutils version combination is needed for this to work,
>> or, alternatively, how would I have to configure the compiler ?
> 
> Hi Guenter,
> 
> This is a GCC bug.  It's fixed in GCC trunk and the fix has been
> backported to 12/13 release branches, so GCC 14.1, 13.3, and 12.4 will
> contain the fix.
> 
> The fix is available at https://gcc.gnu.org/r14-3331, you can apply the
> patch building the compiler.
> 
> Sorry for the inconvenience.
> 

Thanks for the information. I'll add a note to my builders and just disable
gcc plugins for now until the new compiler versions are available.

Guenter

