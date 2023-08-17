Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88112B8E
	for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 11:50:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76c93abeb83so523578485a.0
        for <loongarch@lists.linux.dev>; Thu, 17 Aug 2023 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692273029; x=1692877829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ+Zsa4ZEmXdPvbwBr1YPTSACyU/1n0KQUOcgncJE3w=;
        b=HZzLgdBA/8SEH50ZDj3oHEfSFPvocgYVgAv3TuTxssfPb3/V0hh2OR1DIM66EfLcfa
         UsjSiTEaZaFFhTXX1vyZiQkrq6XmAO6RAYHIr6zdpHG3q3rcNi5pe30IMjGet3b6rhQT
         3S2dXX++c+KVUybFLXY48nq11UI1IM0xiJMFUoa6wLIr4FEap6oUSgPS3ey6UorOrVn4
         6N+NP5pwhNx1Q3n+fkuVVr+Wyvu3YLHZ0O6he9h9/4l8XR7K71XLGptWppEIqIIYtX5W
         AZSdhcvTaX6ZFP5TPnYCRMAgupPqC+b531pzr9911ZikH6L1SDIJZzKqzx1OXvdBqcWN
         fZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692273029; x=1692877829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ+Zsa4ZEmXdPvbwBr1YPTSACyU/1n0KQUOcgncJE3w=;
        b=C6fpOVpUb7JbL3ustFH84bVpgC/l92oOV388LezLR0ZDUb5vVk4iPTiqj85MmB6YRa
         fM9ZBKITD3ennbMe1+ehfPW1YWiuO+THIW+9QIj45j+qjhptkISOFvmjitSW3kfJ+s7M
         67RgwLFV63YX1aMSgBdINUFR2Ust0QxSfi3qt93i7w++BubntQRRCYJLKx4Jj5A/Oksk
         5MeJQv3lX9k59KWzDqXe0W39+Dgcty6HG0Xq3IECvv3afvcn+4BvbnunLryNhizjK+hI
         KUq7Ht7C7QUXqMEhmQyyi8DuohITkUcL4ngUJpwemGzOdVdT9GQ1ZFBF5arnlDgFGOXx
         OtCQ==
X-Gm-Message-State: AOJu0YwJ4dh8NISETZ7xNBqcDfaDi/fn+D1EXrqiCpJtG/zdyflQgScU
	iRSx+WajUafxY+n563ZBwwY=
X-Google-Smtp-Source: AGHT+IFbiQSKDSe4gTLJ2bWwz6IBwKBkogxP7lD8diDOPyUlxXuZx7qBz9naiNHemQYMcPnCfjJYFQ==
X-Received: by 2002:a05:620a:2986:b0:76c:b8b0:769d with SMTP id r6-20020a05620a298600b0076cb8b0769dmr6603385qkp.39.1692273029121;
        Thu, 17 Aug 2023 04:50:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h8-20020ac85148000000b0040ff387de83sm5142149qtn.45.2023.08.17.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:50:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/4] arch/powerpc/configs/*_defconfig cleanup
Date: Thu, 17 Aug 2023 07:50:14 -0400
Message-ID: <20230817115017.35663-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target").

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

