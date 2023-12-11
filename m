Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4C36B1F
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="O3U81Ar2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-77f44cd99c6so308460985a.0
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 08:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702311148; x=1702915948; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=O3U81Ar2hqdWrvz656M/7uLv3KIn4o5Hfmu2ysM5Mg3KV1V+oT/KZjRnheY0JRrwys
         riiUZrumCoW7WXvWj/0mP5l2bVq9LvkO8WVGdMwClddkU5SWIIHLy0NtL72t8T3W88N1
         +mmo6C9G/8JaBQoeRM4oUlHR5iL3QRcV8KwAUWajwKsYOP4IsSk2LOBMsO5hoL/5MFuQ
         tqO+yiSh+k5r9z60EIIsUfct/WXbuPah4wZbdK9L/LIYFxd3Tr7Y7D1FhoanYofpKF5b
         2FTHDUeqOSpEo/UQerQPKGLW0iF7AqL+iSl9pcJLgQ+3nVDZ/0r9/I7WORj6GpWB+rjv
         EnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311148; x=1702915948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpS7YigJlvbtafE8s+IgfD2mhqkpNW2HnzWlJXZ6u0Q=;
        b=MWrKT9Z2CzW1m50FnHN2HcTojNtW2du8NSvOPu7fgLo6s8aaaOL00oihwTLb3fLSrk
         +qDkYWWEwg1EIYzqSia8Zyc2nIonN84F7NXdIa+4QCK08XObbspeC6P/SohUE0skyelP
         gmTWMsrYuVOOCOZ2gaYkI8B7IjArUy+vsO7Bjfy4IkOyjBJG9g0vCoLUvqWL30lb+bc6
         y5opI2sVaGNDDZ22Z/X2LPGcD1kkMjtRtCqMjClBo3BPfwX3766gIPyH25Gd60Z3UCBn
         /zwoj7E9zZ641M8Bf2cHVIC9HJOIGzruyGjgtRC7dGyybQoVsjG2LhMH0+r5uxdso50K
         MJgw==
X-Gm-Message-State: AOJu0YykSBU4mZzTI2uAh8u4AJYxEik+TrWFl6JZ9q/psOQvj5t8Zcqz
	pYh1UQ4CAOvRoRekgbARV9zYPA==
X-Google-Smtp-Source: AGHT+IEC8jdvAnetFbqJVF6lQQw8UXKnB/IQiMsN2t2NyqglmpS9Xy9aZsTAJAYPyNV0NsZe4DU6SA==
X-Received: by 2002:a05:620a:15a8:b0:77d:855d:1b09 with SMTP id f8-20020a05620a15a800b0077d855d1b09mr6457241qkk.0.1702311148452;
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id a15-20020a05620a066f00b0077d78afc513sm3014865qkh.110.2023.12.11.08.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:12:28 -0800 (PST)
Message-ID: <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
Date: Mon, 11 Dec 2023 10:12:27 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
 <ZXczty+Y6dTDL4Xi@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXczty+Y6dTDL4Xi@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-12-11 10:07 AM, Christoph Hellwig wrote:
>> +CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
>> +CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
> 
> Btw, do we even really need the extra variables for compiler flags
> to remove?  Don't gcc/clang options work so that if you add a
> no-prefixed version of the option later it transparently gets removed?

Unfortunately, not all of the relevant options can be no-prefixed:

$ cat float.c 
int main(void) { volatile float f = 123.456; return f / 10; }
$ aarch64-linux-musl-gcc float.c 
$ aarch64-linux-musl-gcc -mgeneral-regs-only float.c 
float.c: In function 'main':
float.c:1:33: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                 ^
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
    1 | int main(void) { volatile float f = 123.456; return f / 10; }
      |                                                     ~~^~~~
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
float.c:1:55: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
$ aarch64-linux-musl-gcc -mgeneral-regs-only -mno-general-regs-only float.c 
aarch64-linux-musl-gcc: error: unrecognized command-line option '-mno-general-regs-only'; did you mean '-mgeneral-regs-only'?
$ 

