Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED264396
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 03:00:01 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-649edb3a3d6so1295116d6.0
        for <loongarch@lists.linux.dev>; Wed, 16 Aug 2023 20:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241200; x=1692846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2GSnqeNoyAE/+SX3es1Oteof6ti0abAFPSQqsiZHHw=;
        b=nQWr89uC0Ngba1SRckU+echVMfhTwA2qk0vDCbhHdOtjAAGdM19nRWPqLBgCr0Duo7
         7rYD5dLldDIFpMazz5Tf135A0CAVP0imv6JyHkX52mUGYyUonKAhaM4xzJbZ4jbfWqpT
         jRkxUOVXjlnyM/G6pQOhk39ERd8wIastgkFTomKSXU8WGZfyXUXiBDbO60AmhQzjBzKP
         rEx+5tscbvHykIJgWX6AvvRShos4qB521nSQYyv2j8U1JPO3qJaP03/AX76O/sqeWF2V
         HT6ELMnIUQFFdssAO8g4/d7WQEhfQTgKwmxtr12KhKA4izqI3id8RZR/e7rVLQH7svHa
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241200; x=1692846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2GSnqeNoyAE/+SX3es1Oteof6ti0abAFPSQqsiZHHw=;
        b=Y2QWB5S2hffNWRYvOdsygJ6S48CzUWwXwa1MSI7ncms4KFzmLY3S/N8KDaUwD69e4f
         Q7RVC2Kktiy1V0AZpZYAHzRCoEDztLfsPaUFUhwpLs4M6EvoU7YrhGx1EpUnYbOUQTVr
         Djs6vIy81yGBE/c8iTWio5oUM6WIYoJ9z3gxOfJC2/3QTTOAinCLXdXKmqXcxTbAeDiK
         IEbKwJ5Qwo9WFzpr5u8oNe04TUFMVnbZtnGHoOivLnaaZUMU9xDwCJaf6/Klb5rQT5xq
         VBJKe6Bn3fArBL2mVPQI9h7fmajMfj4/XKi87XF4zwMPqhHL3oQP8umsH5RnEIOisseP
         dY5w==
X-Gm-Message-State: AOJu0YyBrgbV+4wZCrJKjdljTnQXyQOO0Yr+f/nnKfi5vBO8Buaicixm
	mYgS4oYhlJw3ilmaW2v3WeQ=
X-Google-Smtp-Source: AGHT+IFng0wFZtCSDDiVOY49UxdEFehiYLDUvGYu2W+npgCx1ZI6h5QEe6nSX/rWT8xkkK8CoCgLBA==
X-Received: by 2002:ad4:5d6d:0:b0:63f:9130:4e9c with SMTP id fn13-20020ad45d6d000000b0063f91304e9cmr1855432qvb.26.1692241200467;
        Wed, 16 Aug 2023 20:00:00 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] arch/powerpc/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:39 -0400
Message-ID: <20230817025942.3209-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817025942.3209-1-twoerner@gmail.com>
References: <20230817025942.3209-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 57f8e00d8a82
("usb: 71 musb: Drop old unused am35x glue layer").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 1034aeabdd6c..eaf3273372a9 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -183,7 +183,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

