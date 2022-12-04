Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0047C
	for <loongarch@lists.linux.dev>; Sun,  4 Dec 2022 14:10:43 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso12555885pjt.0
        for <loongarch@lists.linux.dev>; Sun, 04 Dec 2022 06:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GReNEVlKcW8c9mmHy5Eb5Aqiq+Q7po/GXaYqkKKF87g=;
        b=VR7rI0Ebu76XTu5Z3jaUZhPGa/pPPamo8ZRFSv3SdAgtyJxrKcGhHioaQBuw0eBBMQ
         vRrKiqhCc3HOSo56+78L6r+1/6EAm+2qSTFDIN9RahebpJlmiZ0d6gfhLLCKnnWGVDnl
         or4alKrqJxSNHIJ1vATj+M94qhuxyMNE+3/K5AGaY1H75RZfqdSpc12D8CvzYGMVa+E7
         Z/mpEO7PKxhBWzvKOj23JxULWg9gJ0+afWqZmoL1crjvdZebSuGZXFpfxPG1kG9WvJDz
         JoRmq/zEE/elZfhPnTfZaG6hd62DLDAi1gIcAaIsY7avUHzXCEg7QopzHudzC9aHOK7T
         kWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GReNEVlKcW8c9mmHy5Eb5Aqiq+Q7po/GXaYqkKKF87g=;
        b=ZkM53USPp10UVMRTXbkBj4uEc6SgNyZ1pfF3dcxcpBDN5GZG+vhcY/JY4qVI5uEvL0
         87DU+JTiutq3YyLc+BOm+7NfhCHzbCCEGOMpn0YArYscjLXKXWFUtwG7+gaUpQitnL68
         wFW7tiJj3EbSG/wvQb/wDv2XCBncpjvecWn4M6WP4SIx4bMjQDYC3uzjcwRYiLdsnSf/
         b5jNf8a5hjswwn7NyEJ6m9nQnEdE6ZbE4SiFwFPnFlE9t3pOshdr9yixp7qS45ouN9xn
         qcXnwh2xPnkU7roioqI9dwTVPw/24TE2hzh8RLCy7xBSKIbvx0nJXBVcQcBYNtqNloGY
         gCqQ==
X-Gm-Message-State: ANoB5pnkEiGC7xEgpKxY/UtDm4In7n3uey4txFuowPPsnsDNQ5GeCNLg
	6T7f9wPV+CDcLYsHZIm9emn9YfoyUNFbRg==
X-Google-Smtp-Source: AA0mqf5qOqJnbw9QGlNPCgDZWlDd+1S0gXsy3LPR9ZXTomKU8ZInEluekzqJR6CZCY+16vZLVpGe+w==
X-Received: by 2002:a17:903:191:b0:186:5cda:1e01 with SMTP id z17-20020a170903019100b001865cda1e01mr62867137plg.111.1670163042427;
        Sun, 04 Dec 2022 06:10:42 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.8])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902ce8f00b00189947bd9f7sm8880148plg.50.2022.12.04.06.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 06:10:42 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: hengqi.chen@gmail.com
Subject: Question about 'ipmi_si IP I0001:00: There appears to be no BMC at this location'
Date: Sun,  4 Dec 2022 22:10:27 +0800
Message-Id: <20221204141027.2511383-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I built the kernel using loongarch-next branch, had the following errors while booting the newly-built kernel:

    ACPI Error: No response from Global Lock hardware, disabling lock (20220331/evglock-59)
    ipmi_si IP I0001:00: There appears to be no BMC at this location

How can I fix it ? Thanks.

--
Hengqi
