Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E87B;
	Tue, 23 Aug 2022 08:34:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u14so16070702wrq.9;
        Tue, 23 Aug 2022 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=kCvkiarFiXJ9jD4jJ8Afsozfi7HxwB9THrkLcggctw4=;
        b=AJwK8PvK7cqqRaWVCBGh4TIKUuauSmmPTOr3P5eR8YQjakHWqRgiSygCMNRjpeLNWD
         zcv+csKSgVzWW1shfKi5tSLPpSKeFhviuKZJFawMVznW+xYeJ9EqeZ7IaBqfjNbwPYZK
         1su/P5RC0CMJ2FatHA7E+qfliwabhOmq+TD6b7MtmvbBfQFXmjp2VBAwDvESEpK40v1G
         FTHC1V8/3kJjR0p0vc71aKg6tCSka3DOK08d8gYhw3Teeu9M++3a8StGOm+We1s5CcVl
         qJJJP9WeckPZ/+xczr9g/A+XbY3EYVL9HwTGf8KSo/0t3nMtKnDuAgW38PQnLf01yj27
         9NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=kCvkiarFiXJ9jD4jJ8Afsozfi7HxwB9THrkLcggctw4=;
        b=4Km1OoEr7B2YFccga+waq1VgKVazy3Zhd+3Ns2UQOjaZT4QTF4MygvylhDK1ob7cmS
         b5+rULyxPQmMg1ncRouq1qdaDsx9uRcoc/wKtbRcdYimyb3PnajsZQvUEYN8UZKPFYgr
         /SqAvsGUjkd8X2UX0TGxQwm2Kw6ZCe7mxBwApPgN6Sec5X0cn91JFStjYJwk/bNGXWNm
         VX3XffbD748Vqq6kdSojl+lj2DzjWJWUFD5q90wi/qDu5L4VnUnZXUkK/QtwPQSqrBQX
         FCbLtx6bjLfXESii4n8NemLl0oUMhOwM+pifLKiuvrLVqj25Rzdpk0H0Yu9xnqXt8U0/
         b+rw==
X-Gm-Message-State: ACgBeo30dWoRwD9B2RbbJmqOAKS9RXoXuDvypqz6vZeAdxGfgtug3Uas
	gmBb8rpUxE/OEG0yGEfqLC0=
X-Google-Smtp-Source: AA6agR6vwLwj+I7j2yf59mXO9TKSSxRcoAHHO+NJPd7nraHZKpg3XBjAEEjv6P756ndUX1js76Pnrg==
X-Received: by 2002:a05:6000:716:b0:225:3f1a:a9a3 with SMTP id bs22-20020a056000071600b002253f1aa9a3mr9478491wrb.526.1661243673768;
        Tue, 23 Aug 2022 01:34:33 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id d7-20020a05600c3ac700b003a5ad7f6de2sm16355305wms.15.2022.08.23.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 01:34:33 -0700 (PDT)
Date: Tue, 23 Aug 2022 09:34:31 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	torvalds@linux-foundation.org, loongarch@lists.linux.dev
Subject: mainline build failure for loongarch allmodconfig with gcc-12
Message-ID: <YwSRFzQQKAXP2ncp@debian>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

I have been trying to build loongarch as part of my nightly builds, and
I can build loongson3_defconfig without any error. But allmodconfig fails
with the error:

In function '__cmpxchg',
    inlined from 'ssh_seq_next' at drivers/platform/surface/aggregator/controller.c:61:9,
    inlined from 'ssam_request_write_data' at drivers/platform/surface/aggregator/controller.c:1483:8,
    inlined from 'ssam_request_sync_with_buffer' at drivers/platform/surface/aggregator/controller.c:1761:8:
././include/linux/compiler_types.h:354:45: error: call to '__compiletime_assert_9' declared with attribute error: BUILD_BUG failed
  354 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
././include/linux/compiler_types.h:335:25: note: in definition of macro '__compiletime_assert'
  335 |                         prefix ## suffix();                             \
      |                         ^~~~~~
././include/linux/compiler_types.h:354:9: note: in expansion of macro '_compiletime_assert'
  354 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
./arch/loongarch/include/asm/cmpxchg.h:83:17: note: in expansion of macro 'BUILD_BUG'
   83 |                 BUILD_BUG();
      |                 ^~~~~~~~~

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
