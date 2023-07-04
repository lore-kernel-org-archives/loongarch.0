Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E586FB7
	for <loongarch@lists.linux.dev>; Tue,  4 Jul 2023 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688487944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
	b=hvTBd4/dcOgnInwoXXiTNcED5D6tWe1cril3AjgdSxq5v1+f1uQCTxq+h/PtzFG2y6Bzu5
	xHM3LEZhYx1uxbdO85WODDGnuBzv+J+M6ZaaMzsH/Lc6Ez28QD++wAJKL4tAUZ8wXynlgj
	gf45QZbfvxcfevj+TRxBhiq6GhqfaVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-Ti1OuboeMIqelFervTfuMw-1; Tue, 04 Jul 2023 12:25:41 -0400
X-MC-Unique: Ti1OuboeMIqelFervTfuMw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fbaade0c71so36405035e9.2
        for <loongarch@lists.linux.dev>; Tue, 04 Jul 2023 09:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487940; x=1691079940;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
        b=Le8aidUhiS0i8ZFHBPIlBVTXSa4wjuc8dd4LGbLKYJdFj+0XQoEoi5a9sRJk+GC7HT
         yvMo0iO6YZuYtA7m9ZaoP1v0Clx+QeP6yzHnW35Ub3sR6VV4FbBiWLAcjfOvbSQG4Zzq
         4ESO2fzc6LYk6LBgB56iwDBY+tDWo+kIAskEhX3VI9Zqi9n1i73el4ixeWAmqKCIWphx
         WchUs0zYifVWsr/z62iEMpSbW1lzxiZYk/EHMsWnMEYG6yuACx1ysEMAz2acZ4RCuTIK
         NicmRbG088aQhm+a4Zyjr4W+u+hAslZVW0zppihaECeF0iVFJLePV4d1AC7hg4C8suWy
         vgnQ==
X-Gm-Message-State: AC+VfDzP9G/JgZhXHT4TFZdjTRshi6l+K4qDxm9+XoAsTp98wNVrrGks
	3aVa3PuZHAYc56EX9+EntImiJcefZ7Rn4bCUyMqtnV7vAhxFxpRyjF34DHKYn4dpzPETnojnpYZ
	9rede3/jraQlUe25Fi6zN
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082796wmm.19.1688487940449;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5IB6++c8U11SK9oMV+tMdqHs9QUr8ub/i7nSM7HKLee5NlCRabAo+D01Z67Wv3BYjVWg90GQ==
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082767wmm.19.1688487940180;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003143b032b7asm4333122wrx.116.2023.07.04.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:25:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Sudip
 Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Teddy Wang
 <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH 02/12] fbdev/sm712fb: Do not include <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-3-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-3-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:25:39 +0200
Message-ID: <87fs63lk3g.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Sm712fb's dependency on <linux/screen_info.h> is artificial in that
> it only uses struct screen_info for its internals. Replace the use of
> struct screen_info with a custom data structure and remove the include
> of <linux/screen_info.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Helge Deller <deller@gmx.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

