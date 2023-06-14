Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1317E3
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 08:42:41 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QgzJS1Dm4zBQJZ6
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 16:35:20 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1686731720; x=1689323721; bh=5Z4RYXCVxxcnKz4SgOX+aaAGLhM
	lTWSuf80ayN+7ZWM=; b=eI4E2vkwjszS36UwkwElSFHLFkg+leQFl1zBGNh5ioD
	DUCsVtOMALZGQipXsioyzo3Buv9tlZoNnzKUrbBRainPyhYDbVJcl78Z+ZUh16J3
	3KFO15aXYeBJQEB229dnKNweV6IbC+rqdUeecCtuJfRBeX8E6WjHYlyFjK9pavdk
	uPc26tmY3oHEeoGWi2BcTkHOlqHf/998SQ9gBX+3UVayOjI5b/RpF1UqAoFq28eD
	ku+XJc4fQAVh2w1pZ2qI0eekzwd70G1pb0kjQO2U4eQh+0f1ceVdd/3Ze2rtDcAQ
	Pd51qQkAqJterIDUM1QRc+FrQeB81NdAaab1biQcqog==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mb2SUsBxoTM5 for <loongarch@lists.linux.dev>;
	Wed, 14 Jun 2023 16:35:20 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QgzJR6qNczBQJYn;
	Wed, 14 Jun 2023 16:35:19 +0800 (CST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 16:35:19 +0800
From: baomingtong001@208suo.com
To: zhuyinbo@loongson.cn
Cc: loongarch@lists.linux.dev
Subject: [PATCH] soc: loongson: Remove unneeded semicolon from
 loongson2_soc_die_attr()
In-Reply-To: <20230614083326.9822-1-luojianhong@cdjrlc.com>
References: <20230614083326.9822-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <a69170cb55cfc73e378b40ccf1d9c16f@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

./drivers/soc/loongson/loongson2_guts.c:73:2-3: Unneeded semicolon

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  drivers/soc/loongson/loongson2_guts.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c 
b/drivers/soc/loongson/loongson2_guts.c
index bace4bc8e03b..afa559396013 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -70,7 +70,7 @@ static const struct loongson2_soc_die_attr 
*loongson2_soc_die_match(
          if (matches->svr == (svr & matches->mask))
              return matches;
          matches++;
-    };
+    }

      return NULL;
  }
