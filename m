Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A91136B
	for <loongarch@lists.linux.dev>; Wed,  5 Oct 2022 11:54:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a10so13261079wrm.12
        for <loongarch@lists.linux.dev>; Wed, 05 Oct 2022 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCsoKpBjdli7iWIkHe29aBSIVoJwl8PXogMcBODUYio=;
        b=Kg/L3CLDEZ/nyqsQOgq0igi4W4pMphRH+NiO7CgJY4d/sndcCHI9n7AJ4F5clP3MUP
         nj9ZgYxi/0mOofynUPs2SqLciJEf9zMtOxFpN8PeZUIw4S2/dcoqgbsrjjXn3xpcqiZy
         90lfF/Ua7V6ArPVKI0tC6s770FIiER25HS+4T/j4F1j3lYyYODZmraCc2MmLAjuYa/a9
         m5vR9zlaGpynximenCOC6fhki1HW22hRxE9bRvEH+GuyS2zhr0r7RyBoLImL9xv1mGrL
         lAFkVbyRUe4IQ3OGcwYoe29G0vwomRjfyJ7yZm0CVoHGEOer3cMa5cfFmUNkST9w2XbR
         6muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCsoKpBjdli7iWIkHe29aBSIVoJwl8PXogMcBODUYio=;
        b=HNQu/jTTSDfc+xtar4pttyAww6WLUv2HE2cl3K5RaD00Jr+uFKcqxmyHLPd+3IjhaW
         qcUN4iVOewsU2SvcDLgwyuHrOclq0555iCPHJEz94cw2cZdiEzbsJdj/YyO1RTwLT9k5
         iCshlYgMVXyEhJd4kG4nc4xHFLRtRkVhJQiqH66JuPcml24PVVIzOxD6r05dR7TQGtY2
         P2tA/2wqJO/m/2XJ/R1KjK7YmA/JBPJ7qM/MV+nJ/FVapgnxixuvXbn0YcCkRUD9LeC3
         W0+f3H74V8n3gWZ81VhZOiSMCwQzBh/xeBtLyn161dBPX7PehIVWPHCAPq8D84GvoPzm
         Olrw==
X-Gm-Message-State: ACrzQf1hfVfTdFLIbHNRkltqSex4Xh6X/C0Xe/2GU7WGAaYX+liOls5d
	mmAgH2Myc+D57+Wy7CdJzINMiB0nQYw=
X-Google-Smtp-Source: AMsMyM5WMIt4f5MS393VOv9AjgI6yx4Irw8PmuCsNpz2bHT4wI962SVwH4/z5K+dcs6EdH0TqLNnVQ==
X-Received: by 2002:a5d:4f12:0:b0:22e:3920:a09c with SMTP id c18-20020a5d4f12000000b0022e3920a09cmr9616073wru.95.1664970847532;
        Wed, 05 Oct 2022 04:54:07 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id l4-20020a7bc444000000b003a2e92edeccsm1806714wmi.46.2022.10.05.04.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:54:07 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:54:05 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: build failure of next-20221005 due to 9dcf746befa7 ("LoongArch: Use
 generic BUG() handler")
Message-ID: <Yz1wXUklaN66j8Lt@debian>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of loongarch allmodconfig have failed to build next-20221005
with error:

./arch/loongarch/include/asm/cmpxchg.h: In function '__cmpxchg':
././include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_2' declared with attribute error: BUILD_BUG failed
  357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
././include/linux/compiler_types.h:338:25: note: in definition of macro '__compiletime_assert'
  338 |                         prefix ## suffix();                             \
      |                         ^~~~~~
././include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
  357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
./arch/loongarch/include/asm/cmpxchg.h:179:17: note: in expansion of macro 'BUILD_BUG'
  179 |                 BUILD_BUG();
      |                 ^~~~~~~~~


git bisect pointed to 9dcf746befa7 ("LoongArch: Use generic BUG() handler")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
